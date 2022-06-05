import Config

config :unsplashx,
  base_url: System.get_env("UNSPLASH_BASE_URL", "https://api.unsplash.com"),
  client_id: System.get_env("UNSPLASH_CLIENT_ID"),
  secret: System.get_env("UNSPLASH_SECRET")
