defmodule Borrower do
  defstruct [:name, :max_books]

  def make_borrower(n, mb), do: %Borrower{name: n, max_books: mb}

  def get_name(br), do: br.name

  def set_name(n, br), do: %{br | name: n}

  def get_max_books(br), do: br.max_books

  def set_max_books(mb, br), do: %{br | max_books: mb}

  def borrower_to_string(br) do
    get_name(br) <>
      " (" <>
      to_string(get_max_books(br)) <>
      " books)"
  end
end
