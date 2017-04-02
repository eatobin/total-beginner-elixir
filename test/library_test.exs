ExUnit.start

defmodule LibraryTest do

  use ExUnit.Case, async: true

  @br1 Borrower.make_borrower("Borrower1", 1)
  @br2 Borrower.make_borrower("Borrower2", 2)
  @br3 Borrower.make_borrower("Borrower3", 3)

  @brs1 [@br1, @br2]
  @brs2 [@br3, @br1, @br2]

  @bk1 Book.make_book("Title1", "Author1", @br1)
  @bk2 Book.make_book("Title2", "Author2", nil)
  @bk3 Book.make_book("Title3", "Author3", @br3)
  @bk4 Book.make_book("Title4", "Author4", Borrower.make_borrower("Borrower3", 3))

  #test "create itself properly" do
  #  assert Book.get_title(@bk1) == "Title1"
  #  assert Book.get_author(@bk1) == "Author1"
  #  assert Book.get_borrower(@bk1) == nil
  #  assert Book.get_borrower(@bk2) == @br2
  #end

  #test "return a string \"Title1 by Author1; Available\"" do
  #  assert Book.book_to_string(@bk1) == "Title1 by Author1; Available"
  #end

  #test "return a string \"Title1 by Author1; Checked out to Borrower2\"" do
  #  assert Book.book_to_string(@bk2) == "Title1 by Author1; Checked out to Borrower2"
  #end

end
