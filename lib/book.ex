defmodule Book do

  defstruct [:title, :author, :borrower]

  def make_book(t, a), do: %Book{title: t, author: a, borrower: nil}

  def get_title(bk), do: bk.title

  def get_author(bk), do: bk.author

  def get_borrower(bk), do: bk.borrower

  def set_borrower(br, bk), do: %{bk | borrower: br}

  def available_string(bk) do
    br = get_borrower(bk)
    case br do
      nil -> "Available"
        _ -> "Checked out to " <>
               Borrower.get_name(br)
    end
  end

  def book_to_string(bk) do
    get_title(bk) <>
      " by " <> get_author(bk) <>
      "; " <> available_string(bk)
  end

end
