defmodule Exslack.Channels do
  alias Exslack.HttpHandler

  def all(token) do
    HttpHandler.request(:get, %{method: "channels.list", token: token})
  end

  @doc """
  Finds a given channel with a channel id
  
  ### Example
  iex> Exslack.Channels.find(token, "foo")
  """
  def find(token, channel_id) do
    HttpHandler.request(:get, %{method: "channels.info", token: token, channel: channel_id})
  end

  @doc """
  Join a channel by name
  
  ### Example
  iex> Exslack.Channels.join(token, "foo")
  """
  def join(token, channel_name) do
    HttpHandler.request(:get, %{method: "channels.join", token: token, name: channel_name})
  end

  @doc """
  `Leave` a channel by id
  
  ### Example
  iex> Exslack.Channels.leave(token, "foo")
  """
  def leave(token, channel_id) do
    HttpHandler.request(:post, %{method: "channels.leave", token: token, channel_id: channel_id})
  end

end
