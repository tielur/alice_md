defmodule Alice.Handlers.DJO do
  use Alice.Router

  route ~r/hai/, :hello

  def hello(conn) do
    reply("oh hai")
  end
end
