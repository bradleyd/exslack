defmodule ExslackChatTest do
  use ExUnit.Case, async: true

  # note you will need a channel id
  test "post chat.postMesage" do
    {:ok, results } = Exslack.Chat.send(System.get_env("TOKEN"), %{text: "hello world", channel: "notachannelid"})
    assert %{"error" => "channel_not_found", "ok" => false} == results
  end

  test "post chat.delete" do
    #create message
    {:ok, results } = Exslack.Chat.send(System.get_env("TOKEN"), %{text: "hello world", channel: "notachannelid"})
    ts = Map.get(results, "ts")
    {:ok, results } = Exslack.Chat.delete(System.get_env("TOKEN"), %{ts: ts, channel: "notachannelid"})
    assert %{"error" => "channel_not_found", "ok" => false} == results
  end

end
