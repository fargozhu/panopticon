defmodule PanopticonWeb.StoriesLive do
  use PanopticonWeb, :live_view

  alias Panopticon.Stories

  def mount(_params, _session, socket) do
    socket = assign(
      socket,
      stories: Stories.fetch_all_stories(),
      total: 0,
      progress: 0,
      waiting: 0
    )

    { :ok, socket }
  end

  defp select_source_logo(story) do
    assigns = {}
    ~L"""
      <img class="mr-1 h-6 w-6 inline"
        <%= cond do
              story.source == "pivotal" ->
                "src=/images/pivotal.png"
              story.source == "github" ->
                "src=/images/github.png"
              story.source == "jira" ->
                "src=/images/github.png"
            end %>>
    """
  end

  defp source_logo(story) do
    cond do
      story.source == "pivotal" ->
        "/images/pivotal.png"
      story.source == "github" ->
        "/images/github.png"
      story.source == "jira" ->
        "/images/github.png"
    end
  end

  defp waiting_bg_colour(story) do
    if Stories.is_assigned?(story), do: "text-white bg-gray-700", else: "text-white bg-orange-700"
  end

  defp statistics(stories) do
    %{total: 10, progress: 5, waiting: 1}
  end
end
