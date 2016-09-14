defmodule GTIN do
  @moduledoc """
  This module provides a custom datatype for Global Trade Item Numbers.
  This includes the EAN, UPC, ISBN, ISSN standards.

  ## Examples
      iex> GTIN.new(4388810057657)
      %GTIN{id: 438881005765, check_digit: 7}

      iex> GTIN.new("4388810057657")
      %GTIN{id: 438881005765, check_digit: 7}

      iex> GTIN.new("978-3-7643-7755-7")
      %GTIN{id: 978376437755, check_digit: 7}

  Validations:
      iex> ean = GTIN.new(4388810057657)
      iex> GTIN.validate(ean)
      true

      iex> GTIN.validate("978-3-7643-7755-7")
      true

      iex> GTIN.validate("978-3-7643-7785-7") # Typo in ISBN
      false
  """

  defstruct [
    id: nil,
    check_digit: nil,
  ]

@doc """
Creates a new GTIN struct from either:
  * an integer
  * a string which parses as an integer
  * a string containing dashes and numbers (as usual for ISBNs)
"""
def new(gtin) when is_integer(gtin) do
  %GTIN {
    id: div(gtin, 10),
    check_digit: rem(gtin, 10),
  }
end

def new(gtin) when is_bitstring(gtin) do
   gtin
   |> String.replace("-", "")
   |> Integer.parse
   |> fn {num, _} -> num end.()
   |> new
end

@doc """
Validates a GTIN.
Can take either a GTIN struct or any argument valid for `new`.
"""
def validate(%GTIN{id: id, check_digit: check_digit}) do
  case id do
    nil -> false
    id -> check_digit == calculate_checksum(id)
  end
end

def validate(gtin) do
  gtin
  |> new
  |> validate
end

defp calculate_checksum(%GTIN{id: id}) do
  calculate_checksum(id)
end

defp calculate_checksum(id) do
  id
  |> Integer.digits
  |> Enum.reverse
  |> Enum.zip(Stream.cycle([3, 1]))
  |> Enum.reduce(0, fn ({d, w}, acc) -> acc + d * w end)
  |> fn
    x when rem(x, 10) == 0 -> 0
    x -> 10 - rem(x, 10)
  end.()
end


end
