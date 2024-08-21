defmodule ExCashfreeSDK.MixProject do
  use Mix.Project

  @source_url "https://github.com/yatender-oktalk/ex_cashfree_sdk"

  def project do
    [
      app: :ex_cashfree_sdk,
      version: "0.1.3",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:req, "~> 0.5.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp description do
    "An Elixir SDK for Cashfree Payment Gateway"
  end

  defp docs do
    [
      extras: ["README.md"],
      main: "readme",
      source_url: @source_url,
      source_ref: "master",
      homepage_url: @source_url,
      formatters: ["html"]
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url},
      maintainers: ["Yatender Singh"]
    ]
  end
end
