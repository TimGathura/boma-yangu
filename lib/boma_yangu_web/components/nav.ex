defmodule BomaYanguWeb.Components.Nav do
  use BomaYanguWeb, :html

  embed_templates "/nav_component.html"

  def nav(assigns) do
    ~H"""
    <.nav_component/>
    """
  end
end
