defmodule ExslackChatTest do
  use ExUnit.Case, async: true

  # note you will need a channel id
  test "post chat.postMesage" do
    {:ok, results } = Exslack.Chat.send(System.get_env("TOKEN"), %{text: "hello world", channel: "notachannelid"})
    assert %{"error" => "channel_not_found", "ok" => false} == results
  end
end
