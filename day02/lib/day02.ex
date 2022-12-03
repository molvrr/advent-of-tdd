defmodule Day02 do
  @points %{"A" => 1, "B" => 2, "C" => 3, "X" => 1, "Y" => 2, "Z" => 3}
  @win %{"A" => "Y", "B" => "Z", "C" => "X"}
  @lose %{"A" => "Z", "B" => "X", "C" => "Y"}

  def part_one(input), do: process_part(:one, input)

  def part_two(input), do: process_part(:two, input)

  defp process_part(part, input) do
    parse_file(input) |> Enum.map(&match(part, &1)) |> Enum.reduce(&(&1 + &2))
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

  defp match(:one, [enemy, you]) do
    p1 = @points[enemy]
    p2 = @points[you]

    cond do
      p1 == p2 -> 3 + p2
      ["A", "Y"] == [enemy, you] -> 6 + p2
      ["B", "Z"] == [enemy, you] -> 6 + p2
      ["C", "X"] == [enemy, you] -> 6 + p2
      true -> 0 + p2
    end
  end

  defp match(:two, [enemy, you]) do
    case you do
      "Y" -> match(:one, [enemy, enemy])
      "X" -> match(:one, [enemy, @lose[enemy]])
      "Z" -> match(:one, [enemy, @win[enemy]])
    end
  end
end
