defmodule Number do
  def start(n \\ 0) do
    Agent.start(fn -> {n, []} end)
  end

  def stop(pid) do
    Agent.stop(pid)
  end

  def set(pid, n) do
    Agent.update(pid, fn({val, deltas}) -> {n, deltas} end)
  end

  def number(pid) do
    Agent.get(pid, fn({val, deltas}) -> val end)
  end

  def deltas(pid) do
    Agent.get(pid, fn({val, deltas}) -> deltas end)
  end

  def apply(pid, f) do
    Agent.update(pid, fn({val, deltas}) -> 
      new_val = f.(val)
      {new_val, [val - new_val | deltas]}
      
    end)
  end

  def undo(pid) do
    deltas = Agent.get(pid, fn({val, deltas}) -> deltas end)
    
  end

end
