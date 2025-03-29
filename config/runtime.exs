import Config

config :emojibot, Emojibot.Bot,
  app_token: System.fetch_env!("SLACK_APP_TOKEN"),
  bot_token: System.fetch_env!("SLACK_BOT_TOKEN"),
  emoji_channel_id: System.fetch_env!("SLACK_EMOJI_CHANNEL_ID"),
  bot: Emojibot.Bot,
  channels: [
    types: ["public_channel"]
  ]
