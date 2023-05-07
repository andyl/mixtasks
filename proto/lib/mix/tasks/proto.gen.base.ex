defmodule Mix.Tasks.Proto.Gen.Base do
  use Mix.Task

  @shortdoc "A simple mix task proto.gen_base"

  @moduledoc """
  Moduledoc for Proto.GenBase
  """

  import Mix.Generator

  def run(_) do
    IO.puts "This is Proto.Gen.Base"
    tpath("base1.md") |> copy_file("base1.md")
    tpath("base2.md") |> copy_template("base2.md", [dingo: "RIGHTANDWRONG"])
    create_directory("bingo")
  end

  defp tpath(file) do
    relbase = "../../../priv/templates/proto.gen.base/"
    relpath = relbase <> file
    basedir = Path.dirname(__ENV__.file)
    Path.expand(relpath, basedir)
  end
end
