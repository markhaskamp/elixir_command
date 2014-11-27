defmodule NumberTest do
  use ExUnit.Case

  #  setup do
  #    Number.start
  #  end
  #
  #  on_exit do
  #    Number.stop
  #  end

  test "default number is 0" do
    Number.start
    assert 0 == Number.number
    Number.stop
  end

  test "can set the default start number" do
    n = 42
    Number.start n
    assert n == Number.number
  end
end
