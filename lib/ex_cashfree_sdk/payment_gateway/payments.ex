defmodule ExCashfreeSDK.PaymentGateway.Payments do
  @moduledoc """
  Payments APIs implementation for Cashfree SDK
  """
  alias ExCashfreeSDK.HTTPClient.ReqClient

  @type otp_action :: :SUBMIT_OTP | :RESEND_OTP
  @type preauth_action :: :CAPTURE | :VOID

  @spec payment_for_order(String.t()) :: {:ok, any()}
  def payment_for_order(order_id) do
    ReqClient.get("/pg/orders/#{order_id}/payments")
  end

  @spec payment(String.t(), String.t()) :: {:ok, any()}
  def payment(order_id, cf_payment_id) do
    ReqClient.get("/pg/orders/#{order_id}/payments/#{cf_payment_id}")
  end

  @spec order_pay(String.t(), map(), String.t()) :: {:ok, any()}
  def order_pay(payment_session_id, payment_method, offer_id \\ "") do
    ReqClient.post("/pg/orders/sessions", %{
      payment_session_id: payment_session_id,
      payment_method: payment_method,
      offer_id: offer_id
    })
  end

  @doc """
  If you accept OTP on your own page, you can use the below API to send OTP to Cashfree.

  ## Examples
  iex> ExCashfreeSDK.PaymentGateway.submit_or_resend_otp("cf_payment_id", :submit, "123456")
  {:ok, %{}}
  """
  @spec submit_or_resend_otp(String.t(), otp_action()) ::
          {:ok, any()} | {:error, any()}
  def submit_or_resend_otp(cf_payment_id, action, otp \\ "") do
    ReqClient.post("/pg/orders/pay/authenticate/#{cf_payment_id}", %{
      action: action,
      otp: otp
    })
  end

  @spec preauthorization(String.t(), preauth_action(), float()) :: {:ok, any()} | {:error, any()}
  def preauthorization(order_id, action, amount) do
    ReqClient.post("/pg/orders/#{order_id}/authorization", %{
      action: action,
      amount: amount
    })
  end
end
