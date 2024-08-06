defmodule ExCashfreeSDK.PaymentGateway.Orders do
  @moduledoc """
  Orders APIs implementation for Cashfree SDK
  """

  alias ExCashfreeSDK.HTTPClient.ReqClient

  @terminate_status "TERMINATED"

  @type customer :: %{
          optional(:customer_name) => String.t(),
          optional(:customer_email) => String.t(),
          optional(:customer_bank_ifsc) => String.t(),
          optional(:customer_bank_account_number) => String.t(),
          optional(:customer_bank_code) => number(),
          :customer_id => String.t(),
          :customer_phone => String.t()
        }

  @type order :: %{
          customer_details: customer(),
          order_id: String.t() | nil,
          order_currency: String.t(),
          order_amount: float(),
          order_meta: %{
            optional(:return_url) => String.t()
          }
        }

  @spec create_order(order()) :: {:ok, any()}
  def create_order(order) do
    ReqClient.post("/pg/orders", order)
  end

  def get_order(order_id) do
    ReqClient.get("/pg/orders/#{order_id}")
  end

  def terminate_order(order_id) do
    ReqClient.patch("/pg/orders/#{order_id}", %{order_status: @terminate_status})
  end
end
