defmodule TellerApi.Accounts do
  defmacro __using__(_opts) do
    quote do
      def getAccounts do
        accounts = [
          [
            currency: "USD",
            enrollment_id: "enr_nqcfcp2ibegu5mri7u000",
            id: "1",
            institution: [
              id: "first_republic",
              name: "First Republic"
            ],
            last_four: "8707",
            links: [
              balances: "http://localhost:8085/accounts/1/balances",
              details: "http://localhost:8085/accounts/1/details",
              self: "http://localhost:8085/accounts/1",
              transactions: "http://localhost:8085/accounts/1/transactions"
            ],
            name: "My Checking",
            subtype: "checking",
            type: "depository"
          ],
          [
            currency: "USD",
            enrollment_id: "enr_nqcfcp2ibegu5mri7u000",
            id: "2",
            institution: [
              id: "second_republic",
              name: "Second Republic"
            ],
            last_four: "8707",
            links: [
              balances: "http://localhost:8085/accounts/2/balances",
              details: "http://localhost:8085/accounts/2/details",
              self: "http://localhost:8085/accounts/2",
              transactions: "http://localhost:8085/accounts/2/transactions"
            ],
            name: "My Checking",
            subtype: "checking",
            type: "depository"
          ],
          [
            currency: "USD",
            enrollment_id: "enr_nqcfcp2ibegu5mri7u000",
            id: "3",
            institution: [
              id: "third_republic",
              name: "Third Republic"
            ],
            last_four: "8707",
            links: [
              balances: "http://localhost:8085/accounts/3/balances",
              details: "http://localhost:8085/accounts/3/details",
              self: "http://localhost:8085/accounts/3",
              transactions: "http://localhost:8085/accounts/3/transactions"
            ],
            name: "My Checking",
            subtype: "checking",
            type: "depository"
          ],
        ]
        accounts
      end
      def getAccountsDetails do
        accountsDetails = [
          [
            account_id: "1",
            account_number: "487069578707",
            links: [
              account: "https://api.teller.io/accounts/1",
              self: "https://api.teller.io/accounts/1/details"
            ],
            routing_numbers: [
              ach: "438939044"
            ]
          ],
          [
            account_id: "2",
            account_number: "487069578708",
            links: [
              account: "https://api.teller.io/accounts/2",
              self: "https://api.teller.io/accounts/2/details"
            ],
            routing_numbers: [
              ach: "438939045"
            ]
          ],
          [
            account_id: "3",
            account_number: "487069578709",
            links: [
              account: "https://api.teller.io/accounts/3",
              self: "https://api.teller.io/accounts/3/details"
            ],
            routing_numbers: [
              ach: "438939046"
            ]
          ],
        ]
        accountsDetails
      end
    end
  end
end