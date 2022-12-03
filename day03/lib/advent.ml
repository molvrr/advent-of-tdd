let read_lines file =
  In_channel.(with_open_text file input_all) |> Str.(split (regexp "\n"))
;;
