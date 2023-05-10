defmodule AshxTest do
  use ExUnit.Case
  doctest Ashx

  test "greets the world" do
    assert Ashx.hello() == :world
  end
end
