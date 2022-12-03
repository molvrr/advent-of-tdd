module Rucksack = struct
  let lowercase_alphabet = "abcdefghijklmnopqrstuvwxyz"
  let uppercase_alphabet = String.uppercase_ascii lowercase_alphabet

  let to_priority = function
    | Some low when String.contains lowercase_alphabet low -> Char.code low - 96
    | Some high when String.contains uppercase_alphabet high -> Char.code high - 38
    | _ -> 0
  ;;

  let common_type (first_item, second_item) =
    let helper parts_of_first item =
      List.fold_left
        (fun acc v ->
          match acc with
          | None ->
            if String.contains item v then
              Some v
            else
              None
          | x -> x)
        None
        parts_of_first
    in
    let lst = List.of_seq (Seq.map (fun x -> x) (String.to_seq first_item)) in
    helper lst second_item
  ;;

  let common_type2 (first_item, second_item, third_item) =
    let helper parts_of_first item2 item3 =
      List.fold_left
        (fun acc v ->
          match acc with
          | None ->
            if String.contains item2 v && String.contains item3 v then
              Some v
            else
              None
          | x -> x)
        None
        parts_of_first
    in
    let lst = List.of_seq (Seq.map (fun x -> x) (String.to_seq first_item)) in
    helper lst second_item third_item
  ;;

  let items compartment =
    let size = String.length compartment in
    let first_item = String.sub compartment 0 (size / 2) in
    let second_item = String.sub compartment (size / 2) (size / 2) in
    first_item, second_item
  ;;

  let group lst =
    let rec helper acc = function
      | [] -> acc
      | f :: s :: t :: rest -> (f, s, t) :: helper acc rest
      | _ -> assert false
    in
    helper [] lst
  ;;

  let part1 data =
    let priorities =
      List.map
        (fun x ->
          let common = common_type (items x) in
          match common with
          | None -> 0
          | v -> to_priority v)
        data
    in
    List.fold_left (fun acc v -> acc + v) 0 priorities
  ;;

  let part2 data =
    let priorities =
      let items = group data in
      List.map
        (fun x ->
          let common = common_type2 x in
          match common with
          | None -> 0
          | v -> to_priority v)
        items
    in
    List.fold_left (fun acc v -> acc + v) 0 priorities
  ;;
end

let () =
  let data = Advent.read_lines "input.txt" in
  match data with
  | [] -> failwith "Invalid input"
  | x -> Format.printf "Part 1: %d - Part 2: %d" (Rucksack.part1 x) (Rucksack.part2 x)
;;
