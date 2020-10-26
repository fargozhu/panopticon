defmodule Panopticon.Stories do

  defstruct id: nil, title: "", url: "", assignee: "", type: "", source: "", priority: ""

  def fetch_stories() do
    fetch_pivotal_issues()
    |> Enum.concat(fetch_github_issues())
  end

  def fetch_stories(filter) when is_nil(filter) == false do
    case filter do
      "github" ->
          fetch_github_issues()
      "pivotal" ->
          fetch_pivotal_issues()
      _ ->
        fetch_stories()
    end
  end

  def is_assigned?(stories) do
    !is_nil(stories.assignee)
  end

  def fetch_github_issues() do
    with { :ok, body } <- File.read("./assets/json/github.json"),
         { :ok, json } <- Poison.decode(body),
         { :ok, issues } <- map_github_issues(json), do: issues
  end

  def fetch_pivotal_issues() do
    with { :ok, body } <- File.read("./assets/json/pivotaltracker.json"),
         { :ok, json } <- Poison.decode(body),
         { :ok, issues } <- map_pivotal_issues(json), do: issues
  end

  defp map_pivotal_issues(issues) do
    issues
    |> Enum.map(fn(story) ->
        %Panopticon.Stories{
          id: story["id"],
          title: story["name"],
          url: story["url"],
          assignee: story["owned_by_id"],
          source: "pivotal",
          type: story["story_type"],
          priority: "high"
        }
      end)
  end

  defp map_github_issues(issues) do
    issues
    |> Enum.map(fn(story) ->
        %Panopticon.Stories{
          id: story["id"],
          title: story["title"],
          url: story["html_url"],
          assignee: story["assignee"]["login"],
          source: "github",
          type: get_github_issue_type(story["labels"]),
          priority: "high"
        }
      end)
  end

  #defp get_github_issue_type(labels) do
  #  Enum.each(labels, fn(label) ->
  #    IO.puts(label["name"])
  #  end)
  #end

  defp get_github_issue_type(_labels) do
    set_github_type("Type: Enhancement")
  end

  defp set_github_type("Type: Bug"), do: "bug"
  defp set_github_type("Type: Enhancement"), do: "feature"
  defp set_github_type(_), do: "chore"



end
