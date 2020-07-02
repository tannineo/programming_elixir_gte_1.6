defmodule MyList do
  def mapsum([], _func), do: nil
  def mapsum([head | []], func), do: func.(head)
  def mapsum([head | tail], func), do: func.(head) + mapsum(tail, func)

  def max([]), do: nil
  def max([head | []]), do: head
  def max([head | tail]), do: Kernel.max(head, max(tail))

  def caesar([], _n), do: []

  def caesar([head | tail], n) when head + n <= ?z do
    [head + n | caesar(tail, n)]
  end

  def caesar([head | tail], n), do: [head + n - 26 | caesar(tail, n)]
end
