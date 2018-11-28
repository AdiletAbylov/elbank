defmodule ElbankTest do
  use ExUnit.Case
  doctest Elbank

  test "get_daily" do
    Elbank.daily_currency()
  end
end
