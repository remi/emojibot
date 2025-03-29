defmodule Emojibot.Bot do
  use Slack.Bot

  require Logger

  defmodule Message do
    defstruct icon_url: "https://avatars.slack-edge.com/2017-09-16/242182638770_50d22a57a3544dd0bbb7_192.png",
              username: "emojibot",
              text: "",
              channel: nil,
              thread_ts: nil
  end

  def handle_event("emoji_changed", %{"value" => "alias:" <> _, "subtype" => "add"}, _bot), do: :ok

  def handle_event("emoji_changed", %{"name" => name, "value" => value, "subtype" => "add"}, _bot) do
    emoji_channel_id = Application.get_env(:emojibot, __MODULE__)[:emoji_channel_id]
    token = Application.get_env(:emojibot, __MODULE__)[:bot_token]

    # NOTE We cannot use `Slack.Bot.send_message/2` because it’s using a queue that doesn’t return the actual sent message
    {:ok, %{"ok" => true, "message" => %{"ts" => ts}}} = Slack.API.post("chat.postMessage", token, Map.from_struct(%Message{channel: emoji_channel_id, text: ":#{name}:"}))
    {:ok, %{"ok" => true}} = Slack.API.post("chat.postMessage", token, Map.from_struct(%Message{channel: emoji_channel_id, thread_ts: ts, text: value}))
    {:ok, %{"ok" => true}} = Slack.API.post("chat.postMessage", token, Map.from_struct(%Message{channel: emoji_channel_id, thread_ts: ts, text: "`#{name}`"}))

    :ok
  end

  def handle_event(_type, _payload, _bot), do: :ok
end
