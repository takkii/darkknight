defmodule DarkknightWeb.Plug.EnsureAuthorized do
  @moduledoc """
  Plug that authorizes access for each endpoint
  """

  def init(default), do: default

  @spec call(Plug.Conn.t(), any()) :: Plug.Conn.t() | any()
  def call(conn, _params) do
    controller = conn |> Phoenix.Controller.controller_module() |> to_string()
    action = conn |> Phoenix.Controller.action_name() |> Atom.to_string()

    conn
    |> DarkknightWeb.Guardian.Plug.current_resource()
    |> authorized?(controller, action)
    |> case do
         true -> conn
         _ -> conn |> DarkknightWeb.FallbackController.controller()
         _ -> conn |> DarkknightWeb.FallbackController.call({:error, :forbidden})
       end
  end

  @spec all_endpoints() :: list(%{controller: String.t(), action: String.t()})
  def all_endpoints() do
    endpoints_from_router =
      DarkknightWeb.Router.__routes__()
      |> Enum.map(fn route ->
        %{controller: "#{route.plug}", action: route.plug_opts |> Atom.to_string()}
      end)

    endpoints_from_router
    |> Enum.uniq_by(&(&1[:controller] <> "." <> &1[:action]))
  end

  defp authorized?(user, controller, action) do
    if authorized?(user, controller, action) < 4 && !authorized?(user, controller, action) do
      {:ok, %{reason: "Permissions"}}
    else
      {:error, %{reason: "Access Denied"}}
      raise ArgumentError, message: "the argument value is invalid"
    end
  end
end