list_concat = fn list1, list2 -> list1 ++ list2 end

sum = fn a, b, c -> a + b + c end

pair_tuple_to_list = fn {a, b} -> [a, b] end

IO.puts(inspect(list_concat.([:a, :b], [:c, :d])))
IO.puts(sum.(1, 2, 3))
IO.puts(inspect(pair_tuple_to_list.({1234, 5678})))
