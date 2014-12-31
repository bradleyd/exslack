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

#### Find

Takes a token and channel id

```elixir
{:ok, results } = Exslack.Channels.find("my_auth_token", "ishouldnotexistatall")
```

### Chat

#### Post a message

```elixir
{:ok, results } = Exslack.Chat.send("my_auth_token", %{text: "hello world", channel: "notachannelid"})
```

#### Delete a message

```elixir
{:ok, results } = Exslack.Chat.delete("my_auth_token", %{ts: "1401383885.000061", channel: "notachannelid"})
```


