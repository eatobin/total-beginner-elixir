defmodule BookTest do
  use ExUnit.Case

  @br Borrower.make_borrower("Borrower1", 1)
  @bk1 Book.make_book("Title1", "Author1")
  @bk2 Book.set_borrower(@br, @bk1)

  test "create itself properly" do
    assert Book.get_title(@bk1) == "Title1"
    assert Book.get_author(@bk1) == "Author1"
    assert Book.get_borrower(@bk1) == nil
    assert Book.get_borrower(@bk2) == @br
  end

  test "return a string \"Title1 by Author1; Available\"" do
    assert Book.book_to_string(@bk1) == "Title1 by Author1; Available"
  end

  test "return a string \"Title1 by Author1; Checked out to Borrower1\"" do
    assert Book.book_to_string(@bk2) == "Title1 by Author1; Checked out to Borrower1"
  end
end
