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
    <div id="stories">
      <div class="mt-1 max-w-3xl mx-auto flex p-6 bg-gray-300 rounded-lg">
        <ul>
          <%= for story <- @stories do %>
            <li class="mt-1 p-6 bg-gray-100 rounded-lg shadow-xl">
              <!-- First Line -->
              <div class="flex items-center justify-between">
                <!-- group -->
                <div class="mt-0 flex items-center">
                  <img class="mr-1 h-6 w-6 inline" src="/images/GitHub-Mark-32px.png" alt="GitHub Issue">
                  <a class="ml-4 font-medium text-base text-indigo-400 hover:text-indigo-800"href="<%= story.url%>">
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
                    waiting
                  </span>
                  <!-- assignee name -->
                  <div class="ml-3 px-3 py-1 items-center">
                    <img class="mr-1 h-4 w-4 inline" src="/images/users.svg">
                    <span class="text-xs text-gray-500">
                      John Doe
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

    <style>
    .btn {
      @apply font-bold py-2 px-4 rounded;
    }
    .btn-blue {
      @apply bg-blue-500 text-white;
    }
    .btn-blue:hover {
      @apply bg-blue-700;
    }
    </style>
    """
  end
end
