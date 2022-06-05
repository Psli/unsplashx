defmodule Unsplashx.Users do
  alias Unsplashx.Client

  def likes(username, query \\ []) do
    {:ok, res} = Client.get("/users/#{username}/likes", query: query)
    res
  end
end
