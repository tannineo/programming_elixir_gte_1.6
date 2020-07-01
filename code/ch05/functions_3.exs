fizz_buzz_n =
  with fuzz_buzz = fn
         0, 0, _ -> "FizzBuzz"
         0, _, _ -> "Fizz"
         _, 0, _ -> "Buzz"
         _, _, n -> n
       end do
    fn n -> fuzz_buzz.(rem(n, 3), rem(n, 5), n) end
  end

IO.puts(fizz_buzz_n.(10))
IO.puts(fizz_buzz_n.(11))
IO.puts(fizz_buzz_n.(12))
IO.puts(fizz_buzz_n.(13))
IO.puts(fizz_buzz_n.(14))
IO.puts(fizz_buzz_n.(15))
IO.puts(fizz_buzz_n.(16))
