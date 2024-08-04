defmodule ExCashfreeSDK.HTTPClient.ReqClient do
  @moduledoc """
  This module is the HTTP client for Req
  """

  # Replace with your base URL
  @base_url "https://sandbox.cashfree.com"

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
    url = Path.join(@base_url, path)

    client_id = System.get_env("CLIENT_ID", "")
    client_secret = System.get_env("CLIENT_SECRET", "")

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

    dbg(url)

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
end
