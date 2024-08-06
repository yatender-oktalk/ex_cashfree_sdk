defmodule ExCashfreeSdk.PaymentGateway.Settlements do
  @moduledoc """
  Settlements APIs implementation for Cashfree SDK
  """

  alias ExCashfreeSDK.HTTPClient.ReqClient

  def get_settlements_for_order(order_id) do
    ReqClient.get("/pg/orders/#{order_id}/settlements")
  end
end
