defmodule DarkknightWeb.FallbackController do
  use DarkknightWeb, :controller
  alias DarkknightWeb.ErrorView

  def call( conn, assigns ) do
    IO.puts "=================================="
    IO.inspect assigns
    IO.puts "=================================="

    status = 400
    conn
    |> put_status( status )
    |> put_view( ErrorView )
    |> render( "error_html.ex" )
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