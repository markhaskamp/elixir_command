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

  test "change 'n' with a function argument" do
    Number.start
    plus_4 = fn(x) -> x + 4 end
    Number.apply(plus_4)
    assert 4 == Number.number
    Number.stop
  end

  test "convert 'n' from Fahrenheit to Celsius in two steps" do
    Number.start
    Number.set 212

    # convert F to Celsius
    Number.apply(fn(x) -> x - 32 end)
    Number.apply(fn(x) -> x * 5 / 9 end)
    assert 100 == Number.number

    Number.stop
  end


  test "math trick" do
    n = 5     # step 1
    key = 20
    Number.start n

    Number.apply(&(&1 * 2))  # step 2
    Number.apply(&(&1 + key))  # step 3
    Number.apply(&(&1 / 2))    # step 4
    Number.apply(&(&1 - n))    # step 5

    assert (key/2) == Number.number

    Number.stop
  end
end
