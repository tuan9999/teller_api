defmodule TellerApi.Router do
    use Plug.Router
    use Plug.Debugger
    require Logger
  plug(BasicAuth, realm: "API", username: "test_admin", password: "")
  plug(Plug.Logger, log: :debug)


  plug(:match)

  plug(:dispatch)

  # Simple GET Request handler for path /hello
  get "/hello" do
    send_resp(conn, 200, "world")
    IO.inspect(conn)
  end
  
  get "/accounts" do
    send_resp(conn, 200, "Accounts Index")
  end
  
  get "/accounts/:account_id" do
    send_resp(conn, 200, "Accounts #{account_id}")
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