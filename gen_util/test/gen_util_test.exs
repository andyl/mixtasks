defmodule GenUtilTest do
  use ExUnit.Case
  doctest GenUtil

  test "greets the world" do
    assert GenUtil.hello() == :world
  end
end
