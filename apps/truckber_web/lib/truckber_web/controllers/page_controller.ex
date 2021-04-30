defmodule TruckberWeb.PageController do
  use TruckberWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
