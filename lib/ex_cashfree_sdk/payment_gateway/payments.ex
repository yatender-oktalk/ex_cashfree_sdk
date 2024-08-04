defmodule ExCashfreeSDK.PaymentGateway.Payments do
  @moduledoc """
  Payments APIs
  """
  alias ExCashfreeSDK.HTTPClient.ReqClient

  def order_payments(order_id) do
    ReqClient.get("/pg/orders/#{order_id}/payments")
  end

  def payment(order_id, cf_payment_id) do
    ReqClient.get("/pg/orders/#{order_id}/payments/#{cf_payment_id}")
  end
end
