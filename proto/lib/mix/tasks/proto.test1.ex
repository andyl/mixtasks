defmodule Mix.Tasks.Proto.Test1 do
  use Mix.Task

  @shortdoc "A simple mix task proto.test1"

  @moduledoc """
  Moduledoc for ProtoTst.Test1
  """

  def run(_) do
    IO.puts "This is Proto.Test1"
  end
end
