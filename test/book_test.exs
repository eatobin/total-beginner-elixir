ExUnit.start

defmodule BookTest do

  use ExUnit.Case, async: true

  @br2 Borrower.make_borrower("Borrower2", 2)
  @bk1 Book.make_book("Title1", "Author1")
  @bk2 Book.set_borrower(@br2, @bk1)

  test "create itself properly" do
    assert Book.get_title(@bk1) == "Title1"
    assert Book.get_author(@bk1) == "Author1"
    assert Book.get_borrower(@bk1) == nil
    assert Book.get_borrower(@bk2) == @br2
  end

  test "return a string \"Title1 by Author1; Available\"" do
    assert Book.book_to_string(@bk1) == "Title1 by Author1; Available"
  end

  test "return a string \"Title1 by Author1; Checked out to Borrower2\"" do
    assert Book.book_to_string(@bk2) == "Title1 by Author1; Checked out to Borrower2"
  end

end
