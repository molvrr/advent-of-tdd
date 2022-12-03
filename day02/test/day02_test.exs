defmodule Day02Test do
  use ExUnit.Case

  @sample "./sample.txt"
  @input "./input.txt"

  test "part one - sample" do
    assert Day02.part_one(@sample) == 15
  end

  test "part one - input" do
    assert Day02.part_one(@input) == 12276
  end

  test "part two - sample" do
    assert Day02.part_two(@sample) == 12
  end

  test "part two - input" do
    assert Day02.part_two(@input) == 9975
  end
end
