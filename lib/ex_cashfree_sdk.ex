defmodule ExCashfreeSDK do
  @moduledoc """
  ExCashfreeSDK: Elixir SDK for Cashfree Payment Gateway

  This SDK provides a convenient way to interact with Cashfree's Payment Gateway APIs
  in Elixir applications. It includes modules for various payment operations, refunds,
  and settlements.

  ## Modules

  ### ExCashfreeSDK.PaymentGateway.Payments

  Handles payment-related operations:

  - `payment_for_order/1`: Fetch all payments for a specific order
  - `payment/2`: Get details of a specific payment
  - `order_pay/3`: Initiate a payment for an order
  - `submit_or_resend_otp/3`: Submit or resend OTP for payment authentication
  - `preauthorization/3`: Perform preauthorization actions (capture or void)

  ### ExCashfreeSDK.PaymentGateway.Refunds

  Manages refund operations:

  - `create_refund/3`: Create a refund for an order
  - `get_refund/2`: Retrieve details of a specific refund
  - `get_refunds/1`: Fetch all refunds for an order

  ### ExCashfreeSDK.PaymentGateway.Settlements

  Handles settlement-related queries:

  - `get_settlements_for_order/1`: Retrieve settlement information for an order

  ## Usage

  To use this SDK, you need to configure your Cashfree API credentials. Add the following
  to your application's configuration:

      config :ex_cashfree_sdk,
        api_key: "your_api_key",
        api_secret: "your_api_secret",
        environment: :sandbox # or :production

  Then you can use the SDK functions in your application:

      alias ExCashfreeSDK.PaymentGateway.Payments

      # Fetch payment details
      {:ok, payment_details} = Payments.payment("order_123", "payment_456")

  ## Error Handling

  Most functions in this SDK return a tuple `{:ok, result}` for successful operations
  or `{:error, reason}` for failures. Always handle both cases in your application logic.

  ## Additional Resources

  - [Cashfree API Documentation](https://docs.cashfree.com/docs/)
  - [GitHub Repository](https://github.com/your-repo-link)

  For more detailed information about each module and function, please refer to their
  respective documentation.
  """
end
