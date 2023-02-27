defmodule Unsplashx.Users do
  alias Unsplashx.Client

  def profile(username) do
    {:ok, res} = Client.get("/users/#{username}")
    res
  end

  def likes(username, query \\ []) do
    {:ok, res} = Client.get("/users/#{username}/likes", query: query)
    res
  end
end
