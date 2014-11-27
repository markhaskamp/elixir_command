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
    Number.stop
  end

  test "change 'n' with an increment function" do
    Number.start
    plus_4 = fn(x) -> x + 4 end
    Number.apply(plus_4)
    assert 4 == Number.number
    Number.stop
  end
end
