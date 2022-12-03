let sample = Advent.read_lines "../../../sample.txt"

(* Part 1 *)
let () =
  let expected_value = 157 in
  let result = Advent.part1 sample in
  Format.printf "Expected: %d - Received: %d\n" expected_value result;
  assert (result == expected_value)
;;

(* Part 2 *)
let () =
  let expected_value = 70 in
  let result = Advent.part2 sample in
  Format.printf "Expected: %d - Received: %d\n" expected_value result;
  assert (result == expected_value)
;;
