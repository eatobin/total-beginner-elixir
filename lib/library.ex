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
    result = for x <- coll, f.(x) == tgt do x end
    List.first(result)
  end

  def get_books_for_borrower(br, bks) do
    # Enum.filter(bks, fn x -> Book.get_borrower(x) == br end)
    for x <- bks, Book.get_borrower(x) == br, do: x
  end

  def num_books_out(br, bks) do
    length(get_books_for_borrower(br, bks))
  end

  def not_maxed_out(br, bks) do
    num_books_out(br, bks) < Borrower.get_max_books(br)
  end

  def book_not_out(bk) do
    Book.get_borrower(bk) == nil
  end

  def book_out(bk) do
    Book.get_borrower(bk) != nil
  end

  def check_out(n, t, brs, bks) do
    mbk = find_item(t, bks, &Book.get_title/1)
    mbr = find_item(n, brs, &Borrower.get_name/1)
    if (mbk != nil and mbr != nil
          and not_maxed_out(mbr, bks) and book_not_out(mbk)) do
      new_book = Book.set_borrower(mbr, mbk)
      fewer_books = remove_book(mbk, bks)
      add_item(new_book, fewer_books)
    else
      bks
    end
  end

end
