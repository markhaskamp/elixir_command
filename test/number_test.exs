defmodule NumberTest do
  use ExUnit.Case

   setup do
     {:ok, agent} = Number.start
     {:ok, agent: agent}
   end
  
   # on_exit do
   #   Number.stop
   # end

  test "default number is 0", %{agent: agent} do
    assert 0 == Number.number(agent)
  end

  test "change 'n' with a function argument", %{agent: agent} do
    plus_4 = fn(x) -> x + 4 end
    Number.apply(agent, plus_4)
    assert 4 == Number.number(agent)
  end

  test "can set a value for Number", %{agent: agent} do
    Number.set(agent, 42)
    assert 42 == Number.number(agent)
  end

 test "convert 'n' from Fahrenheit to Celsius in two steps", %{agent: agent} do
   Number.set(agent, 212)

   minus_32 = fn(x) -> x-32 end
   almost_halve = fn(x) -> x * 5 / 9 end

   # convert F to Celsius
   Number.apply(agent, minus_32)
   Number.apply(agent, almost_halve)
   assert 100 == Number.number(agent)
 end

 test "convert 'n' from Celsius to Fahrenheit in three steps", %{agent: agent} do

   # convert C to F
   Number.set(agent, 100)
   Number.apply(agent, fn(x) -> x * 9 end)
   Number.apply(agent, fn(x) -> x / 5 end)
   Number.apply(agent, fn(x) -> x + 32 end)
   assert 212 == Number.number(agent)

 end

 test "applied functions are saved as a list", %{agent: agent} do

   Number.apply(agent, fn(x) -> x + 1 end)
   Number.apply(agent, fn(x) -> x + 2 end)
   Number.apply(agent, fn(x) -> x + 4 end)
   Number.apply(agent, fn(x) -> x + 8 end)

   assert 4 == length(Number.commands(agent))
 end

end
