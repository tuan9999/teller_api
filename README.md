# TellerApi

A Simple Sandbox api, written in Elixir, based off of the [teller api](https://teller.io/docs/api/2020-10-12#).

## Usage

To run the project execute `iex -S mix` in the root of the repository.

The following routes are available:
- /accounts
- /accounts/:account_id
- /accounts/:account_id/details
- /accounts/:account_id/balances
- /accounts/:account_id/transactions/:transaction_id

These return the corresponding JSON encoded data.
