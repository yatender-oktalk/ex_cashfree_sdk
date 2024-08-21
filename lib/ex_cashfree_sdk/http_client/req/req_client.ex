defmodule ExCashfreeSDK.HTTPClient.ReqClient do
  @moduledoc """
  This module is the HTTP client for Req
  """

  @default_url "https://sandbox.cashfree.com"

  def get(path, headers \\ [], params \\ %{}) do
    request(:get, path, headers, params)
  end

  def post(path, body, headers \\ []) do
    request(:post, path, headers, body)
  end

  def put(path, body, headers \\ []) do
    request(:put, path, headers, body)
  end

  def patch(path, body, headers \\ []) do
    request(:patch, path, headers, body)
  end

  def delete(path, headers \\ [], params \\ %{}) do
    request(:delete, path, headers, params)
  end

  defp request(method, path, headers, payload) do
    url = Path.join(get_param(:base_url, @default_url), path)

    client_id = get_param(:client_id, System.get_env("CASHFREE_CLIENT_ID", ""))
    client_secret = get_param(:client_secret, System.get_env("CASHFREE_CLIENT_SECRET", ""))

    default_headers = [
      {:content_type, "application/json"},
      {:accept, "application/json"},
      {:x_api_version, "2023-08-01"},
      {:x_client_id, client_id},
      {:x_client_secret, client_secret}
    ]

    # Ensure headers also use atom keys.
    # Assuming `headers` is a keyword list
    merged_headers = Keyword.merge(default_headers, headers)

    options = [
      headers: merged_headers,
      json: payload
    ]

    case apply(Req, method, [url, options]) do
      {:ok, response} -> handle_response(response)
      {:error, error} -> {:error, "Request failed: #{inspect(error)}"}
    end
  end

  defp handle_response(%{status: status, body: body}) do
    case status do
      s when s in 200..299 -> {:ok, body}
      _ -> {:error, "Request failed with status #{status}: #{inspect(body)}"}
    end
  end

  def get_param(key, default \\ nil), do: Application.get_env(:ex_cashfree_sdk, key, default)
end
