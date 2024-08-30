defmodule ExCashfreeSdk.PaymentGateway.Refunds do
  @moduledoc """
  Refunds APIs implementation for Cashfree SDK.

  This module provides functions to create and retrieve refunds for orders
  processed through Cashfree's Payment Gateway.
  """

  alias ExCashfreeSDK.HTTPClient.ReqClient

  @type refund :: %{
          :refund_amount => float(),
          :refund_id => String.t(),
          :refund_note => String.t(),
          optional(:refund_speed) => String.t()
        }

  @doc """
  Creates a refund for a specific order.

  ## Parameters

    * `order_id` - The ID of the order to be refunded.
    * `refund_params` - A map containing refund details (see `t:refund/0`).
    * `refund_splits` - Optional list of refund splits (default: []).

  ## Examples

      iex> refund_params = %{
      ...>   refund_amount: 100.00,
      ...>   refund_id: "refund_123",
      ...>   refund_note: "Customer requested refund",
      ...>   refund_speed: "STANDARD"
      ...> }
      iex> ExCashfreeSdk.PaymentGateway.Refunds.create_refund("order_123", refund_params)
      {:ok, %{refund_id: "refund_123", order_id: "order_123", status: "PENDING"}}

  """
  @spec create_refund(String.t(), refund(), list()) :: {:ok, any()}
  def create_refund(order_id, refund_params, refund_splits \\ []) do
    ReqClient.post("/pg/orders/#{order_id}/refunds", %{
      refund: refund_params,
      refund_splits: refund_splits
    })
  end

  @doc """
  Retrieves details of a specific refund for an order.

  ## Parameters

    * `order_id` - The ID of the order.
    * `refund_id` - The ID of the refund to retrieve.

  ## Examples

      iex> ExCashfreeSdk.PaymentGateway.Refunds.get_refund("order_123", "refund_123")
      {:ok, %{
        refund_id: "refund_123",
        order_id: "order_123",
        status: "PROCESSED",
        amount: 100.00,
        created_at: "2023-04-01T12:00:00Z"
      }}

  """
  @spec get_refund(String.t(), String.t()) :: {:ok, any()}
  def get_refund(order_id, refund_id) do
    ReqClient.get("/pg/orders/#{order_id}/refunds/#{refund_id}")
  end

  @doc """
  Retrieves all refunds for a specific order.

  ## Parameters

    * `order_id` - The ID of the order to fetch refunds for.

  ## Examples

      iex> ExCashfreeSdk.PaymentGateway.Refunds.get_refunds("order_123")
      {:ok, [
        %{refund_id: "refund_123", status: "PROCESSED", amount: 50.00},
        %{refund_id: "refund_124", status: "PENDING", amount: 25.00}
      ]}

  """
  @spec get_refunds(String.t()) :: {:ok, any()}
  def get_refunds(order_id) do
    ReqClient.get("/pg/orders/#{order_id}/refunds")
  end
end
