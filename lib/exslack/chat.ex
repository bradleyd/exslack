defmodule Exslack.Chat do
  
  alias Exslack.HttpHandler
  # NOTE https://api.slack.com/methods/chat.postMessage

  @doc """
  Post's a message to a channel
  ### Returns
  {
    "ok": true,
    "ts": "1405895017.000506"
    "channel": "C024BE91L"
  }

  ### Example
  iex> Exslack.Chat.send(token, %{text: "foo", channel: "bar")
  """
  def send(token, options) do
    options = Map.merge(options, %{method: "chat.postMessage", token: token})
    HttpHandler.request(:post, options)
  end

  @doc """
  Delete a message from a channel
  Need the timestamp of the message to delete

  ### Example
  iex> Exslack.Chat.delete(token, %{ts: "1405894322.002768", channel: "bar")
  """
  def delete(token, options) do
    options = Map.merge(options, %{method: "chat.delete", token: token})
    HttpHandler.request(:post, options)
  end

end
