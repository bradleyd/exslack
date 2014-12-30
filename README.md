Exslack
=======

[slack](https://api.slack.com/web) bindings for [Elixir](http://elixir-lang.org/)

## WIP
* use with caution

## Usage

### Channels

```elixir
{:ok, results } = Exslack.Channels.all("my_auth_token")
```

### Chat

#### Post a message

```elixir
{:ok, results } = Exslack.Chat.send("my_auth_token", %{text: "hello world", channel: "notachannelid"})
```



