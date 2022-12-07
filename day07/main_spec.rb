require 'test/unit'
require './main.rb'

class AdventTest < Test::Unit::TestCase
  FILE = File.read("sample.txt").split("\n")

  def test_one
    instance = DaySeven.new(FILE)

    assert_equal(95437, instance.part_one)
  end

  def test_two
    instance = DaySeven.new(FILE)

    assert_equal(24933642, instance.part_two)
  end
end
