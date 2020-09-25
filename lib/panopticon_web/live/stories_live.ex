defmodule PanopticonWeb.StoriesLive do
  use PanopticonWeb, :live_view

  alias Panopticon.Stories

  def mount(_params, _session, socket) do
    socket = assign(
      socket,
      stories: Stories.fetch_all_stories(),
      type: ""
    )

    { :ok, socket }
  end

  def render(assigns) do
    ~L"""
    <div id="stories">
      <div class="mt-1 max-w-4xl mx-auto flex p-6 bg-gray-300 rounded-lg">
        <div id="filter">
          <form phx-change="filter">
            <div class="inline-block relative w-full">
              <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="sources">
                Source
              </label>
              <select class="block appearance-none w-full bg-white-300 border text-gray-700 py-2 px-2 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500" name="sources">
                <%= options_for_select(source_options(), "sources") %>
              </select>
            </div>
          </form>
        </div>
      </div>

      <div class="mt-1 max-w-4xl mx-auto flex p-6 bg-gray-300 rounded-lg">
        <ul>
          <%= for story <- @stories do %>
            <li class="mt-1 p-3 bg-gray-100 rounded-lg shadow-xl">
              <!-- First Line -->
              <div class="flex items-center justify-between">
                <!-- group -->
                <div class="mt-0 flex items-center">
                  <%= select_source_logo(story) %>
                  <a class="ml-4 font-medium text-base text-indigo-400 hover:text-indigo-800 "href="<%= story.url%>" target="_blank">
                    <%= story.title %>
                  </a>
                </div>
              </div>
              <!-- Second Line -->
              <div class="flex mt-4 items-center justify-between">
                <!-- group -->
                <div class="mt-0 flex items-center">
                  <!-- state button -->
                  <span class="px-3 py-1 rounded text-xs text-white bg-gray-700">
                    <%= if is_assignee?(story) do %>
                      progress
                    <%= else %>
                      waiting
                    <% end %>
                  </span>
                  <!-- issue type -->
                  <div class="ml-3 px-3 py-1 items-center">
                    <img class="mr-1 h-4 w-4 inline" src="/images/ban.svg">
                    <span class="text-xs text-gray-500">
                      <%= story.type %>
                    </span>
                  </div>
                  <!-- issue type -->
                    <div class="ml-3 px-3 py-1 items-center">
                    <img class="mr-1 h-4 w-4 inline" src="/images/arrow-circle-up.svg">
                    <span class="text-xs text-gray-500">
                      high
                    </span>
                  </div>
                  <!-- assignee name -->
                  <div class="ml-3 px-3 py-1 items-center">
                    <img class="mr-1 h-4 w-4 inline" src="/images/users.svg">
                    <span class="text-xs text-gray-500">
                      <%= story.assignee %>
                    </span>
                  </div>
                </div>
                <!-- expand button -->
                <button class="flex items-center py-1 px-3 ml-2 bg-transparent rounded outline-none">
                  <img class="mr-1 h-4 w-4 inline" src="/images/chevron-down.svg">
                </button>
              </div>
            </li>
          <% end %>
        </ul>
      </div>
    </div>
    """
  end

  defp is_assignee?(%{assignee: _}), do: true
  defp is_assignee?(_), do: false

  defp select_source_logo(story) do
    assigns = {}
    IO.inspect story.source
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

  defp select_source_logo()

  defp source_options do
    [
      "*": "all",
      github: "github",
      pivotal: "pivotal",
      jira: "jira"
    ]
  end
end
