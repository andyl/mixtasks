defmodule AshGenTest do
  use ExUnit.Case
  doctest AshGen

  test "greets the world" do
    assert AshGen.hello() == :world
  end
end
