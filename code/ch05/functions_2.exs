fuzz_buzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, n -> n
end

IO.puts(fuzz_buzz.(0, 0, 0))
IO.puts(fuzz_buzz.(0, 1, 1))
IO.puts(fuzz_buzz.(1, 0, 2))
IO.puts(fuzz_buzz.(1, 1, 3))
