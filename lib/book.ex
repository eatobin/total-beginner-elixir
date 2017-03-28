defmodule Book do
  defstruct [:title, :author, :borrower]
  def make_book(t, a), do: %Book{title: t, author: a, borrower: nil}
  def get_title(bk), do: bk.title
  def get_author(bk), do: bk.author
  def get_borrower(bk), do: bk.borrower
  def set_borrower(br, bk), do: %{bk | borrower: br}
  def available_string(bk) do
  
  end
  def borrower_to_string(br) do
    get_name(br) <>
    " (" <>
    to_string(get_max_books(br)) <>
    " books)"
  end
end
