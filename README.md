# Emojibot

Emojibot is a Slack bot that announces new custom emoji to a specific channel.

## Installation

```bash
$ git clone git@github.com:remiprev/emojibot.git
```

## Environment variables

Emojibot expects a few environment variables when it starts.

```bash
# Slack API token linked to the bot
SLACK_API_TOKEN=foo

# Channel name where the bot will forward messages
EMOJI_CHANNEL=#emoji
```

## Usage

```bash
$ mix run --no-halt
```
