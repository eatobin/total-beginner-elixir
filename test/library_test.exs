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
  @bk4 Book.make_book("Title4", "Author4",
    %Borrower{max_books: 3, name: "Borrower3"})

  @bks1 [@bk1, @bk2]
  @bks2 [@bk3, @bk1, @bk2]
  @bks3 [@bk1, @bk2, @bk3, @bk4]

  # @ss "\n--- Status Report of Test Library ---\n\n
  #   Test Library: 3 books; 3 borrowers.\n\n
  #   Title3 by Author3; Checked out to Borrower3\n
  #   Title1 by Author1; Checked out to Borrower1\n
  #   Title2 by Author2; Available\n\n
  #   Borrower3 (3 books)\n
  #   Borrower1 (1 books)\n
  #   Borrower2 (2 books)\n\n
  #   --- End of Status Report ---\n"

  test "add a Borrower or Book correctly" do
    assert Library.add_item(@br3, @brs1) == @brs2
    assert Library.add_item(@br2, @brs1) == @brs1

    assert Library.add_item(@bk3, @bks1) == @bks2
    assert Library.add_item(@bk2, @bks1) == @bks1
  end

  test "remove a Book correctly" do
    assert Library.remove_book(@bk3, @bks2) == @bks1
    assert Library.remove_book(@bk3, @bks1) == @bks1
  end

  test "find a Book or Borrower correctly" do
    assert Library.find_item("Title1", @bks2, &Book.get_title/1) == @bk1
    assert Library.find_item("Title11", @bks2, &Book.get_title/1) == nil

    assert Library.find_item("Borrower1", @brs2, &Borrower.get_name/1) == @br1
    assert Library.find_item("Borrower11", @brs2, &Borrower.get_name/1) == nil
  end

  test "find Books for a Borrower" do
    assert Library.get_books_for_borrower(@br2, @bks1) == []
    assert Library.get_books_for_borrower(@br1, @bks1) == [@bk1]
    assert Library.get_books_for_borrower(@br3, @bks3) == [@bk3, @bk4]
  end

  test "check out a Book correctly" do
    assert Library.check_out("Borrower2", "Title1", @brs1, @bks1) == @bks1
    assert Library.check_out("Borrower2", "NoTitle", @brs1, @bks1) == @bks1
    assert Library.check_out("NoName", "Title1", @brs1, @bks1) == @bks1
    assert Library.check_out("Borrower1", "Title2", @brs1, @bks1) == @bks1
    assert Library.check_out("Borrower2", "Title2", @brs1, @bks1) ==
      [%Book{title: "Title2", author: "Author2", borrower: @br2}, @bk1]
  end

  test "check in a Book correctly" do
    assert Library.check_in("Title1", @bks1) ==
      [%Book{title: "Title1", author: "Author1", borrower: nil}, @bk2]
    assert Library.check_in("Title2", @bks1) == @bks1
    assert Library.check_in("NoTitle", @bks1) == @bks1
  end

end
