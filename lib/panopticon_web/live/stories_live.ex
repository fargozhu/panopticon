defmodule PanopticonWeb.StoriesLive do
  use PanopticonWeb, :live_view

  alias Panopticon.Stories

  def mount(_params, _session, socket) do
    socket = assign(
      socket,
      stories: Stories.fetch_all_stories()
    )

    { :ok, socket }
  end

  def render(assigns) do
    ~L"""
      <h1>Trending Stories</h1>
    """
  end
end
