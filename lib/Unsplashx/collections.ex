defmodule Unsplashx.Collections do
  alias Unsplashx.Client

  def photos(id, query \\ []) do
    {:ok, res} = Client.get("/collections/#{id}/photos", query: query)
    res
  end
end
