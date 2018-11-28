defmodule Elbank do
  @nbkr_url_daily "http://www.nbkr.kg/XML/daily.xml"
  @nbkr_url_weekly "http://www.nbkr.kg/XML/weekly.xml"
  @cp_encoding_string "windows-1251"
  @utf_encoding_string "utf-8"

  @moduledoc """
  Documentation for Elbank.
  """

  @doc """
  Gets xml data from nbkr.kg website and returns map.

  ## Examples

      iex> Elbank.hello()
      :world

  """
  def daily_currency do
    currencyMapFrom(@nbkr_url_daily)
  end

  def weekly_currency do
    currencyMapFrom(@nbkr_url_weekly)
  end

  defp currencyMapFrom(url) do
    HTTPoison.start()
    result = HTTPoison.get!(url)
    utf_encoded = Codepagex.from_string!(result.body, "VENDORS/MISC/US-ASCII-QUOTES")
    prepared_string = String.replace(utf_encoded, @cp_encoding_string, @utf_encoding_string)
    XmlToMap.naive_map(prepared_string)
  end
end
