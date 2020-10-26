defmodule PanopticonWeb.StoriesLive do
  use PanopticonWeb, :live_view

  alias Panopticon.Stories

  def mount(_params, _session, socket) do
    socket = assign(
      socket,
      stories: Stories.fetch_stories(),
      total: 0,
      progress: 0,
      waiting: 0,
      filter: "",
      order: ""
    )

    { :ok, socket }
  end

  def handle_event("filter", %{ "filter" => filter } , socket) do
    stories = Stories.fetch_stories(filter)
    socket = assign(socket, [filter: filter, stories: stories])
    { :noreply, socket }
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

  defp type_logo(story) do
    cond do
      story.type == "bug" ->
        "/images/bug.png"
      story.type == "feature" ->
        "/images/feature.png"
      story.type == "chore" ->
        "/images/chore.png"
    end
  end

  defp priority_logo(story) do
    cond do
      story.priority == "high" ->
        "/images/high_importance.png"
      story.type == "low" ->
        "/images/low_importance.png"
      true ->
        "/images/unknonw_importance.png"
    end
  end

  defp waiting_bg_colour(story) do
    if Stories.is_assigned?(story), do: "text-white bg-gray-700", else: "text-white bg-orange-700"
  end

  defp statistics(stories) do
    %{total: 10, progress: 5, waiting: 1}
  end

end
