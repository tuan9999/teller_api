defmodule TellerApi.GenerateFunctions do
  defmacro __using__(_opts) do
    quote do
      def generateDate do
        date = "2021-#{:rand.uniform(12)}-#{:rand.uniform(30)}"
      end
      def generateAmount do
        amount = :rand.uniform(10000)
      end
      def generateBalance do
        amount = :rand.uniform(100000)
      end
      def generateCategory do
        categories = getMerchantsCatgeories()
        random_number = :rand.uniform(length(categories))
        Enum.at(categories, random_number)
      end
      def generateMerchant do
        merchants = getMerchants()
        random_number = :rand.uniform(length(merchants))
        Enum.at(merchants, random_number)
      end
      def generateTransaction(acc_id, transaction_id) do
        transaction = %{
          account_id: acc_id,
          amount: generateAmount(),
          date: generateDate(),
          description: "Payment",
          details: %{
            category: generateCategory(),
            counterparty: %{
              name: generateMerchant(),
              type: "organization"
            },
            processing_status: "complete"
          },
          id: transaction_id,
          links: %{
            account: "http://localhost:8085/accounts/#{acc_id}",
            self: "http://localhost:8085/accounts/#{acc_id}/transactions/#{transaction_id}"
          },
          running_balance: generateBalance(),
          status: "posted",
          type: "interest"
        }
      end
      def getMerchants do
        merchants = [
          "Uber", "Uber Eats", "Lyft", "Five Guys", "In-N-Out Burger", "Chick-Fil-A", "AMC Metreon",
          "Apple", "Amazon", "Walmart", "Target", "Hotel Tonight", "Misson Ceviche", "The Creamery",
          "Caltrain", "Wingstop", "Slim Chickens", "CVS", "Duane Reade", "Walgreens", "Rooster & Rice",
          "McDonald's", "Burger King", "KFC", "Popeye's", "Shake Shack", "Lowe's", "The Home Depot",
          "Costco", "Kroger", "iTunes", "Spotify", "Best Buy", "TJ Maxx", "Aldi", "Dollar General",
          "Macy's", "H.E. Butt", "Dollar Tree", "Verizon Wireless", "Sprint PCS", "T-Mobile", "Kohl's",
          "Starbucks", "7-Eleven", "AT&T Wireless", "Rite Aid", "Nordstrom", "Ross", "Gap",
          "Bed, Bath & Beyond", "J.C. Penney", "Subway", "O'Reilly", "Wendy's", "Dunkin' Donuts",
          "Petsmart", "Dick's Sporting Goods", "Sears", "Staples", "Domino's Pizza", "Pizza Hut",
          "Papa John's", "IKEA", "Office Depot", "Foot Locker", "Lids", "GameStop", "Sephora", "MAC",
          "Panera", "Williams-Sonoma", "Saks Fifth Avenue", "Chipotle Mexican Grill", "Exxon Mobil",
          "Neiman Marcus", "Jack In The Box", "Sonic", "Shell",
        ]
      end
      def getMerchantsCatgeories do
        merchantsCategories = [
          "accommodation", "advertising", "bar", "charity", "clothing", "dining", "education", "electronics",
          "entertainment", "fuel", "groceries", "health", "home", "income", "insurance", "investment", "loan",
          "office", "phone", "service", "shopping", "software", "sport", "tax", "transport", "transportation",
          "utilities",
        ]
      end
	  end
  end
end
