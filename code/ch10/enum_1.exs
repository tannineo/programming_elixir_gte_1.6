# Convert any collection into a list:
list = Enum.to_list(1..5)
# => [1, 2, 3, 4, 5]

# Concatenate collections:
Enum.concat([1, 2, 3], [4, 5, 6])
# => [1, 2, 3, 4, 5, 6]
Enum.concat([1, 2, 3], 'abc')
# => [1, 2, 3, 97, 98, 99]

# Create collections whose elements are some function of the original:
Enum.map(list, &(&1 * 10))
# => [10, 20, 30, 40, 50]
Enum.map(list, &String.duplicate("*", &1))
# => ["*", "**", "***", "****", "*****"]

# Select elements by position or criteria:
Enum.at(10..20, 3)
# => 13
Enum.at(10..20, 20)
# => nil
Enum.at(10..20, 20, :no_one_here)
# => :no_one_here
Enum.filter(list, &(&1 > 2))
# => [3, 4, 5]

# to get access to is_even
require Integer
# => Integer
Enum.filter(list, &Integer.is_even/1)
# => [2, 4]
Enum.reject(list, &Integer.is_even/1)
# => [1, 3, 5]

# Sort and compare elements:
Enum.sort(["there", "was", "a", "crooked", "man"])
# => ["a", "crooked", "man", "there", "was"]
Enum.sort(["there", "was", "a", "crooked", "man"], &(String.length(&1) <= String.length(&2)))
# => ["a", "was", "man", "there", "crooked"]
Enum.max(["there", "was", "a", "crooked", "man"])
# => "was"
Enum.max_by(["there", "was", "a", "crooked", "man"], &String.length/1)
# => "crooked"

# Split a collection:
Enum.take(list, 3)
# => [1, 2, 3]
Enum.take_every(list, 2)
# => [1, 3, 5]
Enum.take_while(list, &(&1 < 4))
# => [1, 2, 3]
Enum.split(list, 3)
# => {[1, 2, 3], [4, 5]}
Enum.split_while(list, &(&1 < 4))
# => {[1, 2, 3], [4, 5]}

# Join a collection:
Enum.join(list)
# => "12345"
Enum.join(list, ", ")
# => "1, 2, 3, 4, 5"

# Predicate operations:
Enum.all?(list, &(&1 < 4))
# => false
Enum.any?(list, &(&1 < 4))
# => true
Enum.member?(list, 4)
# => true
Enum.empty?(list)
# => false

# Merge collections:
Enum.zip(list, [:a, :b, :c])
# => [{1, :a}, {2, :b}, {3, :c}]
Enum.with_index(["once", "upon", "a", "time"])
# => [{"once", 0}, {"upon", 1}, {"a", 2}, {"time", 3}]

# Fold elements into a single value:
Enum.reduce(1..100, &(&1 + &2))
# => 5050
Enum.reduce(["now", "is", "the", "time"], fn word, longest ->
  if String.length(word) > String.length(longest) do
    word
  else
    longest
  end
end)

# => "time"

Enum.reduce(["now", "is", "the", "time"], 0, fn word, longest ->
  if String.length(word) > longest,
    do: String.length(word),
    else: longest
end)

# => 4

# Deal a hand of cards:
import Enum
deck = for rank <- '23456789TJQKA', suit <- 'CDHS', do: [suit, rank]
# => ['C2', 'D2', 'H2', 'S2', 'C3', 'D3', ...]
deck |> shuffle |> take(13)
# => ['DQ', 'S6', 'HJ', 'H4', 'C7', 'D6', 'SJ', 'S9', 'D7', 'HA', 'S4', 'C2', 'CT']
hands = deck |> shuffle |> chunk_every(13)
# => [
#      ['C6', 'S2', 'D5', 'C5', 'CJ', 'S6', 'HA', 'S9', 'SA', 'D2', 'H2', 'C2', 'DA'],
#      ['H6', 'C3', 'SJ', 'H4', 'HQ', 'ST', 'D7', 'D8', 'CK', 'SQ', 'H7', 'H9', 'CA'],
#      ['S8', 'C4', 'S4', 'CT', 'D6', 'DK', 'C9', 'DQ', 'D3', 'DT', 'C8', 'H5', 'S5'],
#      ['D4', 'HJ', 'H3', 'HT', 'H8', 'S7', 'CQ', 'SK', 'DJ', 'HK', 'S3', 'D9', 'C7']
#    ]
