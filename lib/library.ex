defmodule Library do

  @moduledoc """
  This is the Library module.
  """

  def add_item(x, xs) do
    if Enum.member?(xs, x) do
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

  def find_item(tgt, coll, f) do
    result = Enum.filter(coll, fn x -> f.(x) == tgt end)
    # result = Enum.filter(coll, &(f.(&1) == tgt))
    List.first(result)
  end

end
