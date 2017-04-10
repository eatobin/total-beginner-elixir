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
    # result = Enum.filter(coll, fn x -> f.(x) == tgt end)
    # result = Enum.filter(coll, &(f.(&1) == tgt))
    result = for x <- coll, f.(x) == tgt, do: x
    List.first(result)
  end

  def get_books_for_borrower(br, bks) do
    Enum.filter(bks, fn x -> Book.get_borrower(x) == br end)
  end

end
