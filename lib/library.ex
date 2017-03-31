defmodule Library do
  def add_item(x, xs) do
    if Enum.member?(xs,x) do
      xs
    else
      [x | xs]
    end
  end

  def remove_book(bk, bks) do
    if Enum.member?(bks, bk) do
      Enum.filter(bks, &(&1 != bk))
    else
      bks
    end
  end

#  def find_item(tgt, coll, f) do
#    result = Enum.filter(coll, f.(x) == tgt)
#    List.first(result)
#  end

  def tester(tuple, f, tgt) do
    f.(tuple,0) == tgt
  end

  def dbl(n), do: n * 2
end


dbl = fn(n) -> n * 2 end
Enum.filter([1,2,3], (dbl > 2))
