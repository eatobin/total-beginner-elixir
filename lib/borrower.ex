defmodule Borrower do
  # @derive [Poison.Encoder]

  defstruct [:name, :max_books]

  def make_borrower(n, mb) do
    %Borrower{name: n, max_books: mb}
  end

  def get_name(br) do
    br.name
  end

  def set_name(n, br) do
    %{br | name: n}
  end

  def get_max_books(br) do
    br.max_books
  end

  def set_max_books(mb, br) do
    %{br | max_books: mb}
  end

  def borrower_to_string(br) do
    get_name(br) <> " (" <> to_string(get_max_books(br)) <> " books)"
  end
end
