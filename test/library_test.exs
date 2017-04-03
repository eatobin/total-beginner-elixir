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
  @bk4 Book.make_book("Title4", "Author4", %Borrower{max_books: 3, name: "Borrower3"})

  @bks1 [@bk1, @bk2]
  @bks2 [@bk3, @bk1, @bk2]
  @bks3 [@bk1, @bk2, @bk3, @bk4]

  @ss "\n--- Status Report of Test Library ---\n\nTest Library: 3 books; 3 borrowers.\n\nTitle3 by Author3; Checked out to Borrower3\nTitle1 by Author1; Checked out to Borrower1\nTitle2 by Author2; Available\n\nBorrower3 (3 books)\nBorrower1 (1 books)\nBorrower2 (2 books)\n\n--- End of Status Report ---\n"

  test "add a Borrower correctly" do
    assert Library.add_item(@br3, @brs1) == @brs2
    assert Library.add_item(@br2, @brs1) == @brs1

    assert Library.add_item(@bk3, @bks1) == @bks2
    assert Library.add_item(@bk2, @bks1) == @bks1
  end

  test "remove a Book correctly" do
    assert Library.remove_book(@bk3, @bks2) == @bks1
    assert Library.remove_book(@bk3, @bks1) == @bks1
  end

  #test "return a string \"Title1 by Author1; Available\"" do
  #  assert Book.book_to_string(@bk1) == "Title1 by Author1; Available"
  #end

  #test "return a string \"Title1 by Author1; Checked out to Borrower2\"" do
  #  assert Book.book_to_string(@bk2) == "Title1 by Author1; Checked out to Borrower2"
  #end

end
