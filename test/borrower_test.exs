defmodule BorrowerTest do
  use ExUnit.Case

  @br %Borrower{name: "Borrower1", max_books: 1}

  test "properly creates itself" do
    assert Borrower.get_name(@br) == "Borrower1"
  end
end
