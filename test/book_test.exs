defmodule BookTest do
  use ExUnit.Case

  @br Borrower.make_borrower("Borrower1", 1)
  @bk1 Book.make_book("Title1", "Author1")
  @bk2 Book.set_borrower(@br, @bk1)

  test "create itself properly" do
    assert Book.get_title(@bk1) == "Title1"
    assert Book.get_author(@bk1) == "Author1"
  end
end
