defmodule Mix.Tasks.Proto.Clean.Base do
  use Mix.Task

  @shortdoc "Cleans generates proto assets"

  @moduledoc """
  Cleans generates proto assets
  """

  def run(_) do
    IO.puts("Cleaning assets (bingo base*.md)")
    System.cmd("rm", ~w(-f base*.md))
    System.cmd("rm", ~w(-rf bingo))
  end
end
