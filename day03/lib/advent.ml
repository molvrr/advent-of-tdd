let read_lines file =
  In_channel.(with_open_text file input_all) |> Str.(split (regexp "\n"))
;;

let to_priority c =
  let code = Char.code c in
  match c with
  | 'a' .. 'z' -> code - 96
  | 'A' .. 'Z' -> code - 38
  | _ -> 0
;;

let common_type (first_item, second_item) =
  let char_list = List.of_seq (Seq.map (fun x -> x) (String.to_seq first_item)) in
  List.fold_left
    (fun acc v ->
      match acc with
      | None ->
        if String.contains second_item v then
          Some v
        else
          None
      | x -> x)
    None
    char_list
;;

let common_type3 (first_item, second_item, third_item) =
  let char_list = List.of_seq (Seq.map (fun x -> x) (String.to_seq first_item)) in
  List.fold_left
    (fun acc v ->
      match acc with
      | None ->
        if String.contains second_item v && String.contains third_item v then
          Some v
        else
          None
      | x -> x)
    None
    char_list
;;

let group2 compartment =
  let size = String.length compartment in
  let first_item = String.sub compartment 0 (size / 2) in
  let second_item = String.sub compartment (size / 2) (size / 2) in
  first_item, second_item
;;

let group3 list =
  let rec helper acc = function
    | [] -> acc
    | f :: s :: t :: rest -> (f, s, t) :: helper acc rest
    | _ -> []
  in
  helper [] list
;;

let part1 data =
  let priorities =
    List.map
      (fun x ->
        let common = common_type (group2 x) in
        match common with
        | None -> 0
        | Some v -> to_priority v)
      data
  in
  List.fold_left (fun acc v -> acc + v) 0 priorities
;;

let part2 data =
  let priorities =
    let items = group3 data in
    List.map
      (fun x ->
        let common = common_type3 x in
        match common with
        | None -> 0
        | Some v -> to_priority v)
      items
  in
  List.fold_left (fun acc v -> acc + v) 0 priorities
;;
