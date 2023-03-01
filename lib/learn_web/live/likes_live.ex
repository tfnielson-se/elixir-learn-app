defmodule LearnWeb.LikesLive do
  use LearnWeb, :live_view
  
  #mount
  def mount(_params, _, socket) do
    socket = assign(socket, likes: 0)
    {:ok, socket}
  end

  #render
  def render(assigns) do
    ~H"""
    <h1 style={"font-size: 24px"}><%= @likes %></h1>
    <div>
      <button phx-click="like-up" style={"background: gray"}>
      Like Up
      </button>
      <button phx-click="like-down" style={"background: red"}>
      Like Down
      </button>
    </div>
    """
  end

  #handle events
  def handle_event("like-up", _, socket) do
    socket = update(socket, :likes, &(&1 + 1))
    {:noreply, socket}
  end

  def handle_event("like-down", _, socket) do
    socket = update(socket, :likes, &(&1 - 1))
    {:noreply, socket}
  end

end
