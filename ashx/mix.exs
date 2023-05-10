defmodule Ashx.MixProject do
  use Mix.Project

  def project do
    [
      app: :ashx,
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
      gen_util_dep()
    ]
  end

  defp gen_util_dep do
    case System.get_env("GEN_UTIL_DEP") do
      nil -> {:gen_util, github: "andyl/mixtasks", subdir: "gen_util"}
      path -> {:gen_util, path: path}
    end
  end
end
