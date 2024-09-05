defmodule ExCashfreeSDK.MixProject do
  use Mix.Project

  @version "0.1.5"
  @source_url "https://github.com/yatender-oktalk/ex_cashfree_sdk"

  def project do
    [
      app: :ex_cashfree_sdk,
      version: @version,
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description(),
      docs: docs(),
      name: "ExCashfreeSDK",
      source_url: @source_url,
      homepage_url: @source_url,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:req, "~> 0.5.0"},
      {:ex_doc, "~> 0.29", only: :dev, runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.15", only: :test},
      {:dialyxir, "~> 1.3", only: [:dev], runtime: false}
    ]
  end

  defp description do
    """
    ExCashfreeSDK is an Elixir library for interacting with the Cashfree payment gateway API.
    It provides a simple and intuitive interface to integrate Cashfree's payment services into your Elixir applications.
    """
  end

  defp docs do
    [
      extras: ["README.md", "LICENSE"],
      main: "readme",
      source_url: @source_url,
      source_ref: "v#{@version}",
      formatters: ["html"],
      groups_for_modules: [
        "Payment Gateway": [
          ExCashfreeSDK.PaymentGateway.Payments,
          ExCashfreeSDK.PaymentGateway.Refunds,
          ExCashfreeSDK.PaymentGateway.Settlements
        ],
        "HTTP Client": [
          ExCashfreeSDK.HTTPClient.ReqClient
        ]
      ]
    ]
  end

  defp package do
    [
      name: "ex_cashfree_sdk",
      files: ~w(lib .formatter.exs mix.exs README.md LICENSE),
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url,
        "Changelog" => "#{@source_url}/blob/master/CHANGELOG.md"
      },
      maintainers: ["Yatender Singh"]
    ]
  end
end
