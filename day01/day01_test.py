from day1 import DayOne

SAMPLE_FILE = "./sample.txt"
INPUT_FILE = "./input.txt"

def test_sample_partone():
    instance = DayOne(SAMPLE_FILE)

    result = instance.part_one()

    assert result == 24000


def test_sample_parttwo():
    instance = DayOne(SAMPLE_FILE)

    result = instance.part_two()

    assert result == 45000


def test_input_partone():
    instance = DayOne(INPUT_FILE)

    result = instance.part_one()

    assert result == 69310


def test_input_parttwo():
    instance = DayOne(INPUT_FILE)

    result = instance.part_two()

    assert result == 206104

