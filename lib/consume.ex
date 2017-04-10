defmodule Question do

  @moduledoc """
  This is the Library module.
  """

  def dbl(n) do n * 2 end

  def trp(n) do n * 3 end

  def consumer(list, f) do
    # Enum.filter(list, fn x -> f.(x) > 5 end)
    # Enum.filter(list, &(f.(&1) > 5))
    for n <- list, f.(n) > 5, do: n
  end
end

# dbl = fn n -> n * 2 end
# trp = fn n -> n * 3 end

# Question.consumer([1, 2, 3], &Question.dbl/1)   # => [2]
# Question.consumer([1, 2, 3], &Question.trp/1)   # => [2, 3]

# Question.consumer([1, 2, 3], dbl)   # => [3]
# Question.consumer([1, 2, 3], trp)   # => [2, 3]

# $ iex -S mix
