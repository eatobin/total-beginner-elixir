ExUnit.start

defmodule AssertionTest do

  use ExUnit.Case, async: true

  test "the truth" do
    assert 1 + 1 == 22
  end

end
