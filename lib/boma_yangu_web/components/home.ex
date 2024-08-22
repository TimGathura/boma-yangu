defmodule BomaYanguWeb.Components.Home do
  use BomaYanguWeb, :html

  embed_templates "/home_live_component.html"

  def home(assigns) do
    ~H"""
    <.home_live_component/>
    """
  end
end
