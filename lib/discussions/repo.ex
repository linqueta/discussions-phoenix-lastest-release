defmodule Discussions.Repo do
  use Ecto.Repo,
    otp_app: :discussions,
    adapter: Ecto.Adapters.Postgres
end
