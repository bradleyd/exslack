defmodule Exslack.Channels do
  alias Exslack.HttpHandler

  def all(token) do
    HttpHandler.request(:get, %{url: "channels.list", token: token})
  end
end
