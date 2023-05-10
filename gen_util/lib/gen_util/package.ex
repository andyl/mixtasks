defmodule GenUtil.Package do

  def latest(pkg) do
    System.cmd("mix", ["hex.info", pkg])
    |> elem(0)
    |> String.split("\n")
    |> Enum.filter(&(String.contains?(&1, "Config")))
    |> List.first()
    |> String.replace("Config: ", "")
  end

end
