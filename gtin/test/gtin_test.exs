defmodule GTINTest do
  use ExUnit.Case
  use ExUnit.Parameterized

  test_with_params "decompose gtin into id and check_digit",
    fn (_, name, gtin, _) ->
      id = div(gtin, 10)
      check_digit = rem(gtin, 10)
      assert %GTIN{id: ^id, check_digit: ^check_digit} = GTIN.new(gtin), name
    end do
      GTIN.TestDB.samples
    end

  test_with_params "GTIN from string",
    fn (_, name, gtin, str) ->
      assert GTIN.new(gtin) == GTIN.new(str), name
    end do
      GTIN.TestDB.samples
    end

  test_with_params "Validations",
    fn (gtin, should_validate) ->
      assert GTIN.validate(gtin) == should_validate
      assert (gtin |> GTIN.new |> GTIN.validate) == should_validate
    end do
      GTIN.TestDB.samples
      |> Enum.flat_map(fn {_, name, gtin, str} ->
        [
          {str, true},
          {gtin, true},
          {gtin + 1, false},
        ]
      end)
    end

doctest GTIN
end
