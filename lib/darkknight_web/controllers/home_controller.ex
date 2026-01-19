defmodule DarkknightWeb.HomeController do
  use DarkknightWeb, :controller

  def dark(conn, _params) do
    render(conn, :dark)
  end

  def controller() do
    quote do
      use Phoenix.Controller, namespace: DarkknightWeb
      import Plug.Conn
      alias DarkknightWeb.Router.Helpers, as: Routes

      plug DarkknightWeb.Plug.EnsureAuthorized

      action_fallback DarkknightWeb.FallbackController
    end
  end
end
