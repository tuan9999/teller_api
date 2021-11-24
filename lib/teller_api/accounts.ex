defmodule TellerApi.Accounts do
  defmacro __using__(_opts) do
    quote do
      def getAccounts do
        accounts = [
          %{
            :currency => "USD",
            :enrollment_id => "enr_nqcfcp2ibegu5mri7u001",
            :id => "1",
            :institution => %{
              :id => "first_republic",
              :name => "First Republic"
            },
            :last_four => "8707",
            :links => %{
              :balances => "http://localhost:8085/accounts/1/balances",
              :details => "http://localhost:8085/accounts/1/details",
              :self => "http://localhost:8085/accounts/1",
              :transactions => "http://localhost:8085/accounts/1/transactions"
            },
            :name => "My Checking",
            :subtype => "checking",
            :type => "depository"
          },
          %{
            :currency => "USD",
            :enrollment_id => "enr_nqcfcp2ibegu5mri7u002",
            :id => "2",
            :institution => %{
              :id => "second_republic",
              :name => "Second Republic"
            },
            :last_four => "8707",
            :links => %{
              :balances => "http://localhost:8085/accounts/2/balances",
              :details => "http://localhost:8085/accounts/2/details",
              :self => "http://localhost:8085/accounts/2",
              :transactions => "http://localhost:8085/accounts/2/transactions"
            },
            :name => "My Checking",
            :subtype => "checking",
            :type => "depository"
          },
          %{
            :currency => "USD",
            :enrollment_id => "enr_nqcfcp2ibegu5mri7u003",
            :id => "3",
            :institution => %{
              :id => "third_republic",
              :name => "Third Republic"
            },
            :last_four => "8707",
            :links => %{
              :balances => "http://localhost:8085/accounts/3/balances",
              :details => "http://localhost:8085/accounts/3/details",
              :self => "http://localhost:8085/accounts/3",
              :transactions => "http://localhost:8085/accounts/3/transactions"
            },
            :name => "My Checking",
            :subtype => "checking",
            :type => "depository"
          },
        ]
        accounts
      end
      def getAccountsDetails do
        accountsDetails = [
          %{
            account_id: "1",
            account_number: "487069578707",
            links: %{
              account: "http://localhost:8085/accounts/1",
              self: "http://localhost:8085/accounts/1/details"
            },
            routing_numbers: %{
              ach: "438939044"
            }
          },
          %{
            account_id: "2",
            account_number: "487069578708",
            links: %{
              account: "http://localhost:8085/accounts/2",
              self: "http://localhost:8085/accounts/2/details"
            },
            routing_numbers: %{
              ach: "438939045"
            }
          },
          %{
            account_id: "3",
            account_number: "487069578709",
            links: %{
              account: "http://localhost:8085/accounts/3",
              self: "http://localhost:8085/accounts/3/details"
            },
            routing_numbers: %{
              ach: "438939046"
            }
          },
        ]
        accountsDetails
      end
      def getAccountsBalances do
        accountBalances = [
          %{
            account_id: "1",
            available: "35344.16",
            ledger: "35344.16",
            links: %{
              account: "http://localhost:8085/accounts/1",
              self: "http://localhost:8085/accounts/1/balances"
            }
          },
          %{
            account_id: "2",
            available: "35344.26",
            ledger: "35344.26",
            links: %{
              account: "http://localhost:8085/accounts/2",
              self: "http://localhost:8085/accounts/2/balances"
            }
          },
          %{
            account_id: "3",
            available: "35344.36",
            ledger: "35344.36",
            links: %{
              account: "http://localhost:8085/accounts/3",
              self: "http://localhost:8085/accounts/3/balances"
            }
          },
        ]
      end
    end
  end
end