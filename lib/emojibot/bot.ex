defmodule Emojibot.Bot do
  use Slack

  alias Slack.Lookups
  alias Slack.Web.Chat

  defmodule Message do
    defstruct icon_url: "https://avatars.slack-edge.com/2017-09-16/242182638770_50d22a57a3544dd0bbb7_192.png",
              username: "emojibot",
              thread_ts: nil
  end

  def handle_event(%{name: name, type: "emoji_changed", subtype: "add"}, slack, state) do
    emoji_channel_id =
      :emojibot
      |> Application.get_env(:emoji_channel)
      |> Lookups.lookup_channel_id(slack)

    %{"ok" => true, "message" => %{"ts" => ts}} = Chat.post_message(emoji_channel_id, ":#{name}:", %Message{})
    %{"ok" => true} = Chat.post_message(emoji_channel_id, "`#{name}`", %Message{thread_ts: ts})

    {:ok, state}
  end

  def handle_event(_event, _slack, state), do: {:ok, state}
end
