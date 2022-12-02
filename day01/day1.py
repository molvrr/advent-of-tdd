with open('./day1.txt', 'r') as f:
    data = f.read()

data = [list(map(lambda x: int(x), tuple([y for y in c.split("\n") if y]))) for c in data.split("\n\n")]
final_list = list(map(lambda x: sum(x), data))

max_i = 0
max_v = 0
for i, v in enumerate(final_list):
    if v > max_v and i != max_i:
        max_i = i
        max_v = v

print(sum(sorted(final_list)[:0:-1][0:3]))
