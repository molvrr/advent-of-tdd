defmodule Day02 do
  @points %{"A" => 1, "B" => 2, "C" => 3, "X" => 1, "Y" => 2, "Z" => 3}

  def part1(input) do
    parse_file(input) |> Enum.map(fn x -> match(x) end) |> Enum.reduce(fn acc, v -> acc + v end)
  end

  defp parse_file(f) do
    file = File.read(f)

    case file do
      {:ok, content} ->
        content
        |> String.split("\n", trim: true)
        |> Enum.map(fn x -> x |> String.split(" ") end)

      {:error, _} ->
        []
    end
  end

  defp match([enemy, you]) do
    p1 = @points[enemy]
    p2 = @points[you]

    cond do
      p1 == p2 -> 3 + p2
      enemy == "A" and you == "Y" -> 6 + p2
      enemy == "A" and you == "Z" -> 0 + p2
      enemy == "B" and you == "X" -> 0 + p2
      enemy == "B" and you == "Z" -> 6 + p2
      enemy == "C" and you == "X" -> 6 + p2
      enemy == "C" and you == "Y" -> 0 + p2
    end
  end
end
