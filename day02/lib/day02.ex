defmodule Day02 do
  @points %{"A" => 1, "B" => 2, "C" => 3, "X" => 1, "Y" => 2, "Z" => 3}

  def part1(input) do
    parse_file(input) |> Enum.map(&(match(&1))) |> Enum.reduce(&(&1 + &2))
  end

  def part2(input) do
    parse_file(input) |> Enum.map(&(match_play(&1))) |> Enum.reduce(&(&1 + &2))
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

  defp match_play([enemy, you]) do
    case you do
      "Y" -> match([enemy, enemy])
      "X" -> match([enemy, lose(enemy)])
      "Z" -> match([enemy, win(enemy)])
    end
  end

  defp win(play) do
    case play do
      "A" -> "Y"
      "B" -> "Z"
      "C" -> "X"
    end
  end

  defp lose(play) do
    case play do
      "A" -> "Z"
      "B" -> "X"
      "C" -> "Y"
    end
  end
end
