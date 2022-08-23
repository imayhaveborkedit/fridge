defmodule FridgeWeb.PageController do
  use FridgeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
