defmodule Number do
  def start(n \\ 0) do
    Agent.start(fn -> n end, name: Num)
  end

  def stop do
    Agent.stop(Num)
  end

  def set(val) do
    Agent.update(Num, fn(s) -> val end)
  end

  def number do
    Agent.get(Num, fn(s) -> s end)
  end

  def apply(f) do
    Agent.update(Num, fn(s) -> f.(s) end)
  end

end
