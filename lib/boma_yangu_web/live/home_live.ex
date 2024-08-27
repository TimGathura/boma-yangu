defmodule BomaYanguWeb.HomeLive do
  use BomaYanguWeb, :blank_layout

  import BomaYanguWeb.Components.Nav, warn: false
  import BomaYanguWeb.Components.Home

  def mount(_params, _session, socket) do
    test = 1000
    IO.inspect(socket, label: "Mounted Socket")
    {:ok, assign(socket, test: test)}
  end

  def render(assigns) do
    ~H"""
    
    <.home_live_component/>
    """
  end
end
