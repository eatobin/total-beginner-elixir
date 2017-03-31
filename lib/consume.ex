defmodule Question do
  def dbl(n), do: n * 2
  def trp(n), do: n * 3

  def consumer(xs, f) do
    Enum.filter(xs, f(x) > 5)
  end
end

Question.consumer([1, 2, 3], dbl) # [6]
Question.consumer([1, 2, 3], trp) # [6, 9]

Question.consumer([1, 2, 3], &Question.dbl/1)   # => [6]
Question.consumer([1, 2, 3], &Question.trp/1)   # => [6, 9]