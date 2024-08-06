defmodule ExCashfreeSdk.PaymentGateway.Refunds do
  @moduledoc """
  Refunds APIs implementation for Cashfree SDK
  """

  alias ExCashfreeSDK.HTTPClient.ReqClient

  @type refund :: %{
          :refund_amount => float(),
          :refund_id => String.t(),
          :refund_note => String.t(),
          optional(:refund_speed) => String.t()
        }

  @spec create_refund(String.t(), refund(), list()) :: {:ok, any()}
  def create_refund(order_id, refund_params, refund_splits \\ []) do
    ReqClient.post("/pg/orders/#{order_id}/refunds", %{
      refund: refund_params,
      refund_splits: refund_splits
    })
  end

  @spec get_refund(String.t(), String.t()) :: {:ok, any()}
  def get_refund(order_id, refund_id) do
    ReqClient.get("/pg/orders/#{order_id}/refunds/#{refund_id}")
  end

  @spec get_refunds(String.t()) :: {:ok, any()}
  def get_refunds(order_id) do
    ReqClient.get("/pg/orders/#{order_id}/refunds")
  end
end
