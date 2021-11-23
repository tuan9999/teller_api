defmodule TellerApi.Router do
    use Plug.Router
    use Plug.Debugger
    require Logger
  plug(BasicAuth, realm: "API", username: "test_token", password: "")
  plug(Plug.Logger, log: :debug)

  use TellerApi.Accounts

  plug(:match)

  plug(:dispatch)

  # Simple GET Request handler for path /hello
  get "/hello" do
    send_resp(conn, 200, "world")
    accounts = getAccounts()
    IO.inspect(accounts)
  end
  
  get "/accounts" do
    accounts = getAccounts()
    {status, result} = JSON.encode(accounts)
    send_resp(conn, 200, result)
  end
  
  get "/accounts/:account_id" do
    {account_no, ""} = Integer.parse(account_id)
    accounts = getAccounts()
    if account_no < length(accounts) do
      {status, result} = JSON.encode(Enum.at(accounts, account_no - 1))
      send_resp(conn, 200, result)
    else
      send_resp(conn, 404, "Account not found")
    end
  end
  
  get "/accounts/:account_id/details" do
    send_resp(conn, 200, "Accounts #{account_id} details")
  end
  
  get "/accounts/:account_id/balances" do
    send_resp(conn, 200, "Accounts #{account_id} balances")
  end
  
  get "/accounts/:account_id/transactions" do
    send_resp(conn, 200, "Accounts #{account_id} transactions")
  end
  
  get "/accounts/:account_id/transactions/:transaction_id" do
    send_resp(conn, 200, "Accounts #{account_id} transactions #{transaction_id}")
  end

  # "Default" route that will get called when no other route is matched

  match _ do

    send_resp(conn, 404, "not found")

  end

end