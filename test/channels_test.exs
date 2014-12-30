defmodule ExslackChannelTest do
  use ExUnit.Case

  test "get channels list" do
    IO.inspect Exslack.Channels.all(System.get_env("TOKEN"))
  end
end
 
