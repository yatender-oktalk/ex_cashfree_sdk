defmodule ExCashfreeSDK.PaymentGateway do
  @moduledoc """
  This module contains the APIs related to payment gateway
  """

  alias ExCashfreeSDK.PaymentGateway.Orders
  alias ExCashfreeSDK.PaymentGateway.Payments

  @doc """
  Create order

  ## Examples

      iex> order = %{
        "customer_details" => %{
          "customer_id" => "7112AAA812234",
          "customer_phone" => "9898989898"
        },
        "order_meta" => %{
          "return_url" => "https://example.com/return"
        },
        "order_id" => "playstation_purchase_2",
        "order_currency" => "INR",
        "order_amount" => 10.34
      }
      iex> ExCashfreeSDK.create_order(order)
      {:ok,
       %{
         "cart_details" => nil,
         "cf_order_id" => "2183323902",
         "created_at" => "2024-08-05T03:23:09+05:30",
         "customer_details" => %{
           "customer_email" => nil,
           "customer_id" => "7112AAA812234",
           "customer_name" => nil,
           "customer_phone" => "9898989898",
           "customer_uid" => nil
         },
         "entity" => "order",
         "order_amount" => 10.34,
         "order_currency" => "INR",
         "order_expiry_time" => "2024-09-04T03:23:09+05:30",
         "order_id" => "playstation_purchase_2",
         "order_meta" => %{
           "notify_url" => nil,
           "payment_methods" => nil,
           "return_url" => "https://example.com/return"
         },
         "order_note" => nil,
         "order_splits" => [],
         "order_status" => "ACTIVE",
         "order_tags" => nil,
         "payment_session_id" => "session_xyx",
         "terminal_data" => nil
       }}
  """
  def create_order(order) do
    Orders.create_order(order)
  end

  @doc """
  Get order

  ## Examples

      iex> ExCashfreeSDK.get_order("2183323902")
      {:ok, %{
        "cart_details" => nil,
        "cf_order_id" => "2183323902",
        "created_at" => "2024-08-05T03:23:09+05:30",
        "customer_details" => %{
          "customer_email" => nil,
          "customer_id" => "7112AAA812234",
          "customer_name" => nil,
          "customer_phone" => "9898989898",
          "customer_uid" => nil
        },
        "entity" => "order",
        "order_amount" => 10.34,
        "order_currency" => "INR",
        "order_expiry_time" => "2024-09-04T03:23:09+05:30",
        "order_id" => "playstation_purchase_2",
        "order_meta" => %{
          "notify_url" => nil,
          "payment_methods" => nil,
          "return_url" => "https://example.com/return"
        },
        "order_note" => nil,
        "order_splits" => [],
        "order_status" => "ACTIVE",
        "order_tags" => nil,
        "payment_session_id" => "session_xyx",
        "terminal_data" => nil
      }}
  """
  def get_order(order_id) do
    Orders.get_order(order_id)
  end

  @doc """
  Terminate order

  ## Examples

      iex> ExCashfreeSDK.terminate_order("2183323902")
      {:ok, %{
        # Response structure
      }}
  """
  def terminate_order(order_id) do
    Orders.terminate_order(order_id)
  end

  @doc """
  Order pay

  ## Examples

      iex> ExCashfreeSDK.order_pay("2183323902", "upi", "session_xyx")
      {:ok, %{
        "action" => "custom",
        "cf_payment_id" => "5114911130273",
        "channel" => "link",
        "data" => %{
          "url" => nil,
          "payload" => %{
            "bhim" => "https://payments-test.cashfree.com/pgbillpayuiapi/simulator/5114911130273?txnId=5114911130273&amount=1.00&pa=cashfree@testbank&pn=Cashfree&tr=5114911130273&am=1.00&cu=INR&mode=00&purpose=00&mc=5732&tn=Cashfree%20Simulator%20Payment",
            "default" => "https://payments-test.cashfree.com/pgbillpayuiapi/simulator/5114911130273?txnId=5114911130273&amount=1.00&pa=cashfree@testbank&pn=Cashfree&tr=5114911130273&am=1.00&cu=INR&mode=00&purpose=00&mc=5732&tn=Cashfree%20Simulator%20Payment",
            "gpay" => "https://payments-test.cashfree.com/pgbillpayuiapi/simulator/5114911130273?txnId=5114911130273&amount=1.00&pa=cashfree@testbank&pn=Cashfree&tr=5114911130273&am=1.00&cu=INR&mode=00&purpose=00&mc=5732&tn=Cashfree%20Simulator%20Payment",
            "paytm" => "https://payments-test.cashfree.com/pgbillpayuiapi/simulator/5114911130273?txnId=5114911130273&amount=1.00&pa=cashfree@testbank&pn=Cashfree&tr=5114911130273&am=1.00&cu=INR&mode=00&purpose=00&mc=5732&tn=Cashfree%20Simulator%20Payment",
            "phonepe" => "https://payments-test.cashfree.com/pgbillpayuiapi/simulator/5114911130273?txnId=5114911130273&amount=1.00&pa=cashfree@testbank&pn=Cashfree&tr=5114911130273&am=1.00&cu=INR&mode=00&purpose=00&mc=5732&tn=Cashfree%20Simulator%20Payment",
            "web" => "https://sandbox.cashfree.com/pg/view/upi/4krk7c0l1.session_UY10UB1AAt1t9kv_7_3hyL7Fl0z0D0f3TH9yIuu29A2aNmCFr6zzOUF5DrVTYzomL3UqbmnmkrBQVHEE_pzK0JVJcmJNci29JdDI2rsk9mDy.39d601b7-ec26-486f-a663-87a7186cf6e7"
          },
          "content_type" => nil,
          "method" => nil
        },
        "payment_amount" => 1,
        "payment_method" => "upi"
      }}
  """
  def order_pay(payment_session_id, payment_method, offer_id \\ "") do
    Payments.order_pay(payment_session_id, payment_method, offer_id)
  end
end
