defmodule ExslackChannelTest do
  use ExUnit.Case

  test "get channels.list" do
    {:ok, results } = Exslack.Channels.all(System.get_env("TOKEN"))
    
    assert Map.has_key?(results, "channels")
    assert is_list(Map.get(results, "channels"))
  end
end
 
