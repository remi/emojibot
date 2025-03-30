defmodule Emojibot do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      {Slack.Supervisor, Application.fetch_env!(:emojibot, Emojibot.Bot)}
    ]

    opts = [strategy: :one_for_one, name: Emojibot.Supervisor]

    Supervisor.start_link(children, opts)
  end
end
