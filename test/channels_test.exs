defmodule ExslackChannelTest do
  use ExUnit.Case, async: true

  test "get channels.list" do
    {:ok, results } = Exslack.Channels.all(System.get_env("TOKEN"))
    assert Map.get(results, "ok") == true

    assert Map.has_key?(results, "channels")
    assert is_list(Map.get(results, "channels"))
  end

  test "get channels.info" do
    {:ok, results } = Exslack.Channels.find(System.get_env("TOKEN"), "ishouldnotexistatall")
    assert Map.get(results, "ok") == false
    assert %{"error" => "channel_not_found", "ok" => false} == results
  end

  ## note this will create a channel by that name if it does not exist
  test "get channels.join" do
    {:ok, results } = Exslack.Channels.join(System.get_env("TOKEN"), "api-test")
    assert Map.get(results, "ok") == true
  end

  test "post channels.leave" do
    {:ok, results } = Exslack.Channels.leave(System.get_env("TOKEN"), "iamnotachannelid")
    assert Map.get(results, "ok") == false
    assert %{"error" => "channel_not_found", "ok" => false} == results
  end
end
 
