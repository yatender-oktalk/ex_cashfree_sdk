defmodule ExCashfreeSDK.PaymentGateway do
  @moduledoc """
  This module contains the APIs related to payment gateway
  """

  alias ExCashfreeSDK.PaymentGateway.Orders

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
end
