import Config

# Slack
config :slack, api_token: System.get_env("SLACK_API_TOKEN")

# Emojibot
config :emojibot, emoji_channel_id: System.get_env("EMOJI_CHANNEL_ID")
