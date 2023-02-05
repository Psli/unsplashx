defmodule Tesla.Middleware.UnsplashxSimpleResponse do
  @behaviour Tesla.Middleware

  def call(env, next, _opts) do
    env
    |> Tesla.run(next)
    |> build_response()
  end

  def build_response({:error, reasonn}), do: {:error, reasonn}

  def build_response({:ok, env}) do
    data = env.body
    IO.inspect(env.headers)

    metadata =
      env.headers
      |> take_headers(["x-total", "x-per-page"])
      |> Enum.map(fn {k, v} ->
        k = String.replace_prefix(k, "x-", "")
        {k, v}
      end)
      |> Enum.into(%{})
    {:ok, %{data: data, metadata: metadata}}
  end

  def take_headers(headers, keys) do
    Enum.reduce_while(keys, [], fn key, acc ->
      # [v | _] = for {^key, value} <- headers, do: value
      value = Enum.find(headers, fn {k, _} -> k == key end)
      IO.inspect(value)
      if value != nil, do: {:cont, [value | acc]}, else: {:halt, acc}
    end)
  end
end

defmodule Unsplashx.Client do
  use Tesla

  import Unsplashx, only: [get_base_url: 0, get_client_id: 0]

  @decode_content_types ["application/json", "text/javascript", "text/plain"]

  adapter(Tesla.Adapter.Hackney)

  plug(Tesla.Middleware.UnsplashxSimpleResponse)
  plug(Tesla.Middleware.JSON, decode_content_types: @decode_content_types)

  plug(Tesla.Middleware.Headers, [{"authorization", "Client-ID #{get_client_id()}"}])
  plug(Tesla.Middleware.BaseUrl, get_base_url())
end
