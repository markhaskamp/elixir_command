defmodule Number do
  def start(n \\ 0) do
    Agent.start(fn -> n end, name: __MODULE__)
  end

  def stop do
    Agent.stop __MODULE__
  end

  def number do
    Agent.get(__MODULE__, fn(s) -> s end)
  end

end
