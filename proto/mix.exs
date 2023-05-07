defmodule Proto.MixProject do
  use Mix.Project

  def project do
    [
      app: :proto,
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
      injector_dep()
    ]
  end

  defp injector_dep do
    case System.get_env("INJECTOR_PATH") do
      nil -> {:injector, github: "andyl/mixtasks", subdir: "injector"}
      path -> {:injector, path: path}
    end
  end
end
