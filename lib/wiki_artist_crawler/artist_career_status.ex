defmodule ArtistCareerStatus do
  use Crawly.Spider


  @impl Crawly.Spider

  def base_url() do
    "https://https://en.wikipedia.org/wiki"
  end

  @impl Crawly.Spider
  def parse_item(_response) do
    %Crawly.ParsedItem{:items => [], :requests => []}
  end

  @impl Crawly.Spider
  def init() do
    [
      start_urls: ["https://en.wikipedia.org/wiki"]
    ]
  end


  @spec is_artist_tributable?(binary) :: boolean
  def is_artist_tributable?(artist_name) do
    artist_name
    |> sanitize_single_space()
    |> get_artist_doc()
    |> Floki.raw_html =~ "Died"
  end

  # TODO:// use below selector to check "Years Active" row.,
  #
  # mw-content-text > div.mw-parser-output > table.infobox.vcard.plainlist > tbody > tr:nth-child(6) > th > span
  def is_band_tributable?(band_name) do
    band_name
    |> sanitize_single_space()
    |> get_artist_doc()
    |> Floki.raw_html =~ "Died"
  end

  def sanitize_single_space(name) do
    name |> replace_if_spaced()
  end

  def replace_if_spaced(name) do
    name_for_query = name

    if not String.contains?(name_for_query, " ") do
      name_for_query
    end

    if String.contains?(name_for_query, " ") do
      pattern = :binary.compile_pattern(" ")
      String.replace(name_for_query, pattern, "_")
    end
  end

  def get_vcard(doc) do
    doc
    |> Floki.find("table.infobox.biography.vcard")
    # |> Floki.find("tr")
  end

  @base_url "https://en.wikipedia.org/wiki/"
  @spec get_wiki_response(binary) ::
          {HTTPoison.Response.t(), Crawly.ParsedItem.t(), list, %{optional(atom) => any}}
          | HTTPoison.Response.t()
  def get_wiki_response(artist_name) do
    Crawly.fetch(@base_url <> artist_name)
  end

  def get_artist_doc(artist_name) do
    response = get_wiki_response(artist_name)
    {:ok, doc} = Floki.parse_document(response.body)
    doc
  end
end
