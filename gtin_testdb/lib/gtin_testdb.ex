defmodule GTIN.TestDB do
  @moduledoc """
  A small database of GTIN (EAN-13, EAN-8, ISBN) samples.
  """

  @doc"""
  Some examples of GTINs.

  The format is:
      {<type>, <name>, <GTIN as Integer>, <GTIN representation as String>}

  ## Example:
      iex> Enum.at(GTIN.TestDB.samples, 1)
      {:gtin13, "Ja! Natürliches Mineralwasser 6er Gebinde", 4388810058043, "4388810058043"}
  """
  def samples do
     [
       # GTIN-13 (EAN-13)
       {:gtin13, "Ja! Natürliches Mineralwasser", 4388810057657, "4388810057657"},
       {:gtin13, "Ja! Natürliches Mineralwasser 6er Gebinde", 4388810058043, "4388810058043"},
       {:gtin13, "NIVEA MEN FRESH ACTIVE", 4005808726240, "4005808726240"},
       # GTIN-8 (EAN-8)
       {:gtin8, "AquaPur 5x Schwammtuch", 20056520, "20056520"},
       {:gtin8, "Lord Nelson Summertime", 20417048, "20417048"},
       # ISBN-13
       {:isbn, "Analysis I (Dritte Auflage)", 9783764377557, "978-3-7643-7755-7"},
     ]
  end
end
