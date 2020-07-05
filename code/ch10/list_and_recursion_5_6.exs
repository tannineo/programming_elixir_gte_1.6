defmodule MyEnum do
  # Check `h Enum.all?`

  def all?(list, func \\ & &1)
  def all?([], _func), do: true

  def all?([head | tail], func) do
    if func.(head) do
      all?(tail, func)
    else
      false
    end
  end

  # Check `h Enum.each`

  def each([], _func), do: :ok

  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  # Check `h Enum.filter`

  def filter([], _func), do: []

  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  # Check `h Enum.split`
  # TODO
end
