# ExCashfreeSDK

ExCashfreeSDK is an Elixir library for interacting with the Cashfree payment gateway API.

https://docs.cashfree.com/reference

## Installation

Add `ex_cashfree_sdk` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_cashfree_sdk, "~> 0.1.0"}
  ]
end
```

## Configuration

ExCashfreeSDK uses the sandbox environment by default. To configure the base URL for API requests, you can set it in your application's configuration.

For sandbox environment (default):
No additional configuration is needed. The SDK will use https://sandbox.cashfree.com as the base URL.

For production environment:
Add the following to your config/config.exs (or the appropriate environment-specific config file):

```elixir
config :ex_cashfree_sdk, base_url: "https://api.cashfree.com"
```
