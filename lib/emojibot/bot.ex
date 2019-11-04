defmodule Emojibot.Bot do
  # Inclusions
  use Slack

  def handle_event(%{name: name, type: "emoji_changed", subtype: "add"}, slack, state) do
    emoji_channel = Application.get_env(:emojibot, :emoji_channel)
    send_message(":#{name}: (`#{name}`)", emoji_channel, slack)

    {:ok, state}
  end

  def handle_event(_event, _slack, state), do: {:ok, state}
end
