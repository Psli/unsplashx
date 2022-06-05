defmodule Unsplashx do
  @moduledoc """
  Documentation for `Unsplashx`.
  """

  alias Unsplashx.Client


  def get_base_url() do
    Application.get_env(:unsplashx, :base_url)
  end

  def get_client_id() do
    Application.get_env(:unsplashx, :client_id)
  end

  def get_secret() do
    Application.get_env(:unsplashx, :secret)
  end

end
