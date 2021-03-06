defmodule Alice.Handlers.DJO do
  use Alice.Router
  alias Alice.Conn

  command ~r/thanks/i,                                      :thanks
  route   ~r/\bthanks,? alice\b/i,                          :thanks
  command ~r/\bI (love|:heart:) you\b/i,                    :alice_love
  route   ~r/\b(I )?(luv|love|:heart:) (yo)?u,? alice\b/i,  :alice_love
  route   ~r/\balice,? I (love|:heart:) you\b/i,            :alice_love

  @doc "Either `thanks alice` or `@alice thanks` - tell Alice thanks"
  def thanks(conn), do: "no prob, bob" |> reply(conn)

  @doc """
  Express some love for Alice
      `I love you alice`
      `I `:heart:` you, alice`
      `alice, I love`/:heart:` you`
      `@alice I love`/:heart:` you`
  """
  def alice_love(conn) do
    [love|_rest] = conn.message.captures |> Enum.reverse
    emoji = Enum.random(~w[:wink: :heart_eyes: :kissing_heart: :hugging_face:])
    "aww, I #{love} you too, #{Conn.at_reply_user(conn)}! #{emoji}" |> reply(conn)
  end
end
