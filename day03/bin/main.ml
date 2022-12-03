let () =
  let data = Advent.read_lines "input.txt" in
  match data with
  | [] -> failwith "Invalid input"
  | x -> Format.printf "Part 1: %d - Part 2: %d\n" (Advent.part1 x) (Advent.part2 x)
;;
