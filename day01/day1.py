class DayOne():
  def __init__(self, file):
    self.file = file
    self.parse_data()

  def part_one(self):
    return max(self.final_list)

  def part_two(self):
    return sum(sorted(self.final_list)[:0:-1][0:3])

  def parse_data(self):
    with open(self.file, 'r') as f:
      data = f.read()

    result = [map(int, [y for y in c.split("\n") if y]) for c in data.split("\n\n")]
    self.final_list = map(sum, result)
