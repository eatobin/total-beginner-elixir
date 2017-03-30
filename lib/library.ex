defmodule Library do
  def add_item(x, xs) do
    if Enum.member?(xs,x) do
      xs
    else
    [x | xs]
    end
  end
end
