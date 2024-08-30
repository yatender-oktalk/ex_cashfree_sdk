defmodule ExCashfreeSdk.PaymentGateway.Settlements do
  @moduledoc """
  Settlements APIs implementation for Cashfree SDK.

  This module provides functions to retrieve settlement information
  for orders processed through Cashfree's Payment Gateway.
  """

  alias ExCashfreeSDK.HTTPClient.ReqClient

  @doc """
  Retrieves settlement information for a specific order.

  ## Parameters

    * `order_id` - The ID of the order to fetch settlements for.

  ## Returns

    * `{:ok, settlements}` - A list of settlement details for the order.
    * `{:error, reason}` - If there was an error fetching the settlements.

  ## Examples

      iex> ExCashfreeSdk.PaymentGateway.Settlements.get_settlements_for_order("order_123")
      {:ok, [
        %{
          settlement_id: "settlement_001",
          order_id: "order_123",
          amount: 1000.00,
          status: "PROCESSED",
          settled_at: "2023-04-01T12:00:00Z"
        },
        %{
          settlement_id: "settlement_002",
          order_id: "order_123",
          amount: 500.00,
          status: "PENDING",
          settled_at: nil
        }
      ]}

  """
  @spec get_settlements_for_order(String.t()) :: {:ok, list(map())} | {:error, any()}
  def get_settlements_for_order(order_id) do
    ReqClient.get("/pg/orders/#{order_id}/settlements")
  end
end
