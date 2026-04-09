defmodule Sdvig do
  def check(s, t) do
    if String.length(s) != String.length(t) do
      "NO"
    else
      s_len = String.length(s)
      if s_len == 0 do
        "YES"
      else
        loop(s, t, s_len, 0)
      end
    end
  end

  defp loop(_s, _t, s_len, s_len) do
    "NO"
  end

  defp loop(s, t, s_len, i) do
    flag = 1
    flag = inner_loop(s, t, s_len, i, 0, flag)
    if flag == 1 do
      "YES"
    else
      loop(s, t, s_len, i + 1)
    end
  end

  defp inner_loop(_s, _t, s_len, _i, s_len, flag) do
    flag
  end

  defp inner_loop(s, t, s_len, i, j, flag) do
    if String.at(s, rem(j + i, s_len)) != String.at(t, j) do
      0
    else
      inner_loop(s, t, s_len, i, j + 1, flag)
    end
  end
end

s = IO.gets("Введите первую строку: ") |> String.trim()
t = IO.gets("Введите вторую строку: ") |> String.trim()
IO.puts(Sdvig.check(s, t))