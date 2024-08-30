defmodule ExCashfreeSDK.PaymentGateway.Orders do
  @moduledoc """
  Provides functions to interact with Cashfree's Payment Gateway Orders API.

  This module allows you to create, retrieve, and terminate orders using Cashfree's Payment Gateway.

  ## Examples

      alias ExCashfreeSDK.PaymentGateway.Orders

      # Create an order
      order_data = %{
        customer_details: %{
          customer_id: "123456789",
          customer_phone: "9908734801",
          customer_email: "john@cashfree.com",
          customer_name: "John Doe"
        },
        order_id: "xx-yy-zz-12345",
        order_amount: 111,
        order_currency: "INR"
      }

      {:ok, created_order} = Orders.create_order(order_data)

      # Get an order
      {:ok, order} = Orders.get_order("xx-yy-zz-12345")

      # Terminate an order
      {:ok, terminated_order} = Orders.terminate_order("xx-yy-zz-12345")
  """

  alias ExCashfreeSDK.HTTPClient.ReqClient

  @terminate_status "TERMINATED"

  @typedoc """
  Represents customer details for an order.

  ## Fields

    * `:customer_id` - Unique identifier for the customer (required)
    * `:customer_phone` - Customer's phone number (required)
    * `:customer_email` - Customer's email address
    * `:customer_name` - Customer's name
    * `:customer_bank_account_number` - Customer's bank account number
    * `:customer_bank_ifsc` - Customer's bank IFSC code
    * `:customer_bank_code` - Customer's bank code
  """
  @type customer :: %{
          optional(:customer_name) => String.t(),
          optional(:customer_email) => String.t(),
          optional(:customer_bank_ifsc) => String.t(),
          optional(:customer_bank_account_number) => String.t(),
          optional(:customer_bank_code) => number(),
          :customer_id => String.t(),
          :customer_phone => String.t()
        }

  @typedoc """
  Represents an order to be created or retrieved.

  ## Fields

    * `:customer_details` - Customer information (see `t:customer/0`)
    * `:order_id` - Unique identifier for the order
    * `:order_amount` - Amount of the order
    * `:order_currency` - Currency of the order (e.g., "INR")
    * `:order_meta` - Additional metadata for the order
  """
  @type order :: %{
          customer_details: customer(),
          order_id: String.t() | nil,
          order_currency: String.t(),
          order_amount: float(),
          order_meta: %{
            optional(:return_url) => String.t()
          }
        }

  @doc """
  Creates a new order using Cashfree's Payment Gateway.

  ## Parameters

    * `order` - Map containing order details (see `t:order/0`)

  ## Returns

    * `{:ok, response}` if the order was created successfully
    * `{:error, reason}` if there was an error creating the order

  ## Example

      order_data = %{
        customer_details: %{
          customer_id: "123456789",
          customer_phone: "9908734801",
          customer_email: "john@cashfree.com",
          customer_name: "John Doe"
        },
        order_id: "xx-yy-zz-12345",
        order_amount: 111,
        order_currency: "INR"
      }

      {:ok, created_order} = ExCashfreeSDK.PaymentGateway.Orders.create_order(order_data)
  """
  @spec create_order(order()) :: {:ok, any()} | {:error, any()}
  def create_order(order) do
    ReqClient.post("/pg/orders", order)
  end

  @doc """
  Retrieves an existing order from Cashfree's Payment Gateway.

  ## Parameters

    * `order_id` - String containing the unique identifier of the order

  ## Returns

    * `{:ok, response}` if the order was retrieved successfully
    * `{:error, reason}` if there was an error retrieving the order

  ## Example

      {:ok, order} = ExCashfreeSDK.PaymentGateway.Orders.get_order("xx-yy-zz-12345")
  """
  @spec get_order(String.t()) :: {:ok, any()} | {:error, any()}
  def get_order(order_id) do
    ReqClient.get("/pg/orders/#{order_id}")
  end

  @doc """
  Terminates an existing order in Cashfree's Payment Gateway.

  ## Parameters

    * `order_id` - String containing the unique identifier of the order to terminate

  ## Returns

    * `{:ok, response}` if the order was terminated successfully
    * `{:error, reason}` if there was an error terminating the order

  ## Example

      {:ok, terminated_order} = ExCashfreeSDK.PaymentGateway.Orders.terminate_order("xx-yy-zz-12345")
  """
  @spec terminate_order(String.t()) :: {:ok, any()} | {:error, any()}
  def terminate_order(order_id) do
    ReqClient.patch("/pg/orders/#{order_id}", %{order_status: @terminate_status})
  end
end
