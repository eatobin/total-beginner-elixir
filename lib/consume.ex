defmodule Question do
  def dbl(n), do: n * 2
  def trp(n), do: n * 3

  def consumer(list, f) do
  #    Enum.filter(list, fn x -> f.(x) > 5 end)
    Enum.filter(list, &(f.(&1) > 5))
  end
end

# Question.consumer([1, 2, 3], &Question.dbl/1)   # => [2]
# Question.consumer([1, 2, 3], &Question.trp/1)   # => [2, 3]
