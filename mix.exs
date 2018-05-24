defmodule AliceMD.MixProject do
  use Mix.Project

  def project do
    [
      app: :alice_md,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {
        Alice, %{
          handlers: [
            Alice.Handlers.DJO,
            Alice.Handlers.GoogleImages,
            Alice.Handlers.Karma
          ]
        }
      }
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:alice, "~> 0.3.6"},
      {:alice_google_images, "~> 0.1.4"},
      {:alice_karma, "~> 0.3.5"}
    ]
  end
end
