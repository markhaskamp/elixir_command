defmodule Number do
  def start(n \\ 0) do
    Agent.start(fn -> {n, []} end)
  end

  def stop(pid) do
    Agent.stop(pid)
  end

  def set(pid, n) do
    Agent.update(pid, fn({val, cmds}) -> {n, cmds} end)
  end

  def number(pid) do
    Agent.get(pid, fn({val, cmds}) -> val end)
  end

  def apply(pid, f) do
    Agent.update(pid, fn({val, cmds}) -> {f.(val), [f|cmds]} end)
  end

  def commands(pid) do
    Agent.get(pid, fn({val, cmds}) -> cmds end)
  end

end
