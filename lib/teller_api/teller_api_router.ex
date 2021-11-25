defmodule TellerApi.Router do
    use Plug.Router
    use Plug.Debugger
    require Logger
  plug(BasicAuth, realm: "API", username: "test_token", password: "")
  plug(Plug.Logger, log: :debug)

  use TellerApi.Accounts
  use TellerApi.GenerateFunctions

  plug(:match)

  plug(:dispatch)
  
  get "/accounts" do
    accounts = getAccounts()
    {_status, result} = JSON.encode(accounts)
    send_resp(conn, 200, result)
  end
  
  get "/accounts/:account_id" do
    {account_no, ""} = Integer.parse(account_id)
    accounts = getAccounts()
    if account_no <= length(accounts) do
      {_status, result} = JSON.encode(Enum.at(accounts, account_no - 1))
      send_resp(conn, 200, result)
    else
      send_resp(conn, 404, "Account not found")
    end
  end
  
  get "/accounts/:account_id/details" do
    {account_no, ""} = Integer.parse(account_id)
    accounts = getAccounts()
    if account_no <= length(accounts) do
      accountsDetails = getAccountsDetails()
      {_status, result} = JSON.encode(Enum.at(accountsDetails, account_no - 1))
      send_resp(conn, 200, result)
    else
      send_resp(conn, 404, "Account not found")
    end
  end
  
  get "/accounts/:account_id/balances" do
    {account_no, ""} = Integer.parse(account_id)
    accounts = getAccounts()
    if account_no <= length(accounts) do
      accountsBalances = getAccountsBalances()
      {_status, result} = JSON.encode(Enum.at(accountsBalances, account_no - 1))
      send_resp(conn, 200, result)
    else
      send_resp(conn, 404, "Account not found")
    end
  end
  
  get "/accounts/:account_id/transactions" do
    {account_no, ""} = Integer.parse(account_id)
    accounts = getAccounts()
    if account_no <= length(accounts) do
      send_resp(conn, 200, "transactions")
    else
      send_resp(conn, 404, "Account not found")
    end
  end
  
  get "/accounts/:account_id/transactions/:transaction_id" do
    {account_no, ""} = Integer.parse(account_id)
    accounts = getAccounts()
    if account_no <= length(accounts) do
      transaction = generateTransaction(account_no, transaction_id)
      {_status, result} = JSON.encode(transaction)
      send_resp(conn, 200, result)
    else
      send_resp(conn, 404, "Account not found")
    end
  end

  # "Default" route that will get called when no other route is matched

  match _ do

    send_resp(conn, 404, "not found")

  end

end