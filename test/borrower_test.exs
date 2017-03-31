ExUnit.start

defmodule BorrowerTest do
  use ExUnit.Case, async: true

  @br1 Borrower.make_borrower("Borrower1", 1)

  test "create itself properly" do
    assert Borrower.get_name(@br1) == "Borrower1"
    assert Borrower.get_max_books(@br1) == 1
  end

  test "set a new name and maxBooks" do
    assert Borrower.set_name("Borrower1", %Borrower{name: "Jack", max_books: 1}) == @br1
    assert Borrower.set_max_books(1, %Borrower{name: "Borrower1", max_books: 11}) == @br1
  end

  test "return a string \"Borrower1 (1 books)\"" do
    assert Borrower.borrower_to_string(@br1) == "Borrower1 (1 books)"
  end
end
