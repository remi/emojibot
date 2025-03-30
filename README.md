# Emojibot

Emojibot is a Slack bot that announces new custom emoji to a specific channel.

## Installation

```bash
$ git clone git@github.com:remiprev/emojibot.git
```

## Environment variables

Emojibot expects a few environment variables when it starts.

```bash
# Slack tokens linked to the bot
SLACK_APP_TOKEN=foo
SLACK_BOT_TOKEN=bar

# Channel ID where the bot will forward messages
EMOJI_CHANNEL_ID=C…
```

## Usage

```bash
$ mix run --no-halt
```
