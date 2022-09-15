defmodule WoodchuckTest do
  use ExUnit.Case
  doctest Woodchuck

  test "greets the world" do
    assert Woodchuck.hello() == :world
  end
end
