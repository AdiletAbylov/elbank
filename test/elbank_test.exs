defmodule ElbankTest do
  use ExUnit.Case
  doctest Elbank

  test "greets the world" do
    assert Elbank.hello() == :world
  end
end
