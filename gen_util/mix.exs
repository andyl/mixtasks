defmodule GenUtil.MixProject do
  use Mix.Project

  def project do
    [
      app: :gen_util,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:phoenix, "~> 1.7"},
      {:inflex, "~> 2.0"}
    ]
  end
end
