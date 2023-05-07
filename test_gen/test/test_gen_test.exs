defmodule TestGenTest do
  use ExUnit.Case
  doctest TestGen

  test "greets the world" do
    assert TestGen.hello() == :world
  end
end
