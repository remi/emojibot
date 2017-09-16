defmodule Emojibot do
  # Inclusions
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Slack.Bot, [Emojibot.Bot, [], Application.get_env(:slack, :api_token)])
    ]

    opts = [strategy: :one_for_one, name: Emojibot.Supervisor]

    Supervisor.start_link(children, opts)
  end
end
