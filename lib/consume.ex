defmodule Question do

  @moduledoc """
  This is the Library module.
  """

  def dbl(n) do
    n * 2
  end

  def trp(n) do
    n * 3
  end

  def consumer(list, f) do
  #    Enum.filter(list, fn x -> f.(x) > 5 end)
    Enum.filter(list, &(f.(&1) > 5))
  end
end

# Question.consumer([1, 2, 3], &Question.dbl/1)   # => [2]
# Question.consumer([1, 2, 3], &Question.trp/1)   # => [2, 3]
