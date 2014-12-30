defmodule Exslack.Chat do
  
  alias Exslack.HttpHandler
  # NOTE https://api.slack.com/methods/chat.postMessage

  @doc """
  Post's a message to a channel
  
  ### Example
  iex> Exslack.Chat.send(token, %{text: "foo", channel: "bar")
  """
  def send(token, options) do
    options = Map.merge(options, %{method: "chat.postMessage", token: token})
    HttpHandler.request(:post, options)
  end
end
