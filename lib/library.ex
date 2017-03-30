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
end
