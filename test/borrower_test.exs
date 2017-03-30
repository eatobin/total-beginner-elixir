defmodule BorrowerTest do
  use ExUnit.Case

  @br Borrower.make_borrower("Borrower1", 1)

  test "create itself properly" do
    assert Borrower.get_name(@br) == "Borrower1"
    assert Borrower.get_max_books(@br) == 1
  end

  test "set a new name and maxBooks" do
    assert Borrower.set_name("Borrower1", %Borrower{name: "Jack", max_books: 1}) == @br
    assert Borrower.set_max_books(1, %Borrower{name: "Borrower1", max_books: 11}) == @br
  end

  test "return a string \"Borrower1 (1 books)\"" do
    assert Borrower.borrower_to_string(@br) == "Borrower1 (1 books)"
  end
end
