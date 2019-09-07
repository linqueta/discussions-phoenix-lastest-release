defmodule DiscussionsWeb.PageController do
  use DiscussionsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
