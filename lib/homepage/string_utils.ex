defmodule Homepage.StringUtils do
  def truncate(string, max_length)
      when is_binary(string) and is_integer(max_length) and max_length > 0 do
    cond do
      String.length(string) <= max_length ->
        string

      true ->
        words = String.split(string, " ")
        do_truncate(words, "", max_length)
    end
  end

  def truncate(nil, _max_length), do: nil

  def truncate(_string, max_length) when not is_integer(max_length) or max_length <= 0,
    do: raise(ArgumentError, "max_length must be a positive integer")

  defp do_truncate([], acc, _max_length), do: String.trim(acc)

  defp do_truncate([word | rest], acc, max_length) do
    potential_result = if acc == "", do: word, else: acc <> " " <> word

    if String.length(potential_result) <= max_length do
      do_truncate(rest, potential_result, max_length)
    else
      case acc do
        "" -> String.slice(word, 0, max_length - 3) <> "..."
        _ -> String.trim(acc) <> "..."
      end
    end
  end
end
