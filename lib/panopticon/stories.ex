defmodule Panopticon.Stories do

  def fetch_all_stories() do
    list_stores()
  end

  def list_stores do
    [
      %{
        assignee: %{
          id: 2063848,
          login: "thardeck",
          type: "User",
        },
        assignees: [
          %{
            id: 2063848,
            login: "thardeck",
            type: "User",
          }
        ],
        body: "The SUSE .net buildpack was not updated since April because there are issues in our .net update pipeline.\r\nhttps://github.com/SUSE/cf-dotnet-core-buildpack/releases\r\n\r\n## Acceptance criteria\r\n* The latest .net upstream buildpack is also available for the SUSE stack",
        comments: 0,
        id: 691956143,
        labels: [
          %{
            color: "e65c00",
            default: false,
            description: "",
            id: 1709895209,
            name: "Priority: High",
            node_id: "MDU6TGFiZWwxNzA5ODk1MjA5",
            url: "https://api.github.com/repos/cloudfoundry-incubator/kubecf/labels/Priority:%20High"
          },
          %{
            color: "e6b800",
            default: false,
            description: "",
            id: 1709902801,
            name: "Type: Maintenance",
            node_id: "MDU6TGFiZWwxNzA5OTAyODAx",
            url: "https://api.github.com/repos/cloudfoundry-incubator/kubecf/labels/Type:%20Maintenance"
          },
          %{
            color: "001500",
            default: false,
            description: "",
            id: 2011893458,
            name: "suse-cap",
            node_id: "MDU6TGFiZWwyMDExODkzNDU4",
            url: "https://api.github.com/repos/cloudfoundry-incubator/kubecf/labels/suse-cap"
          }
        ],
        number: 1284,
        state: "open",
        title: "Update SUSE .net buildpack",
        updated_at: "2020-09-11T11:23:36Z",
        url: "https://api.github.com/repos/cloudfoundry-incubator/kubecf/issues/1284",
      },
      %{
        assignee: %{
          id: 2063848,
          login: "thardeck",
          type: "User",
        },
        assignees: [
          %{
            id: 2063848,
            login: "thardeck",
            type: "User",
          }
        ],
        body: "## Acceptance Criteria\r\n\r\n- update the buildpacks (SLE15) bump pipeline to write to the new files\r\n- update the stemcell bump pipeline to write to the new files\r\n- pause the pipelines that bump stuff for SCF\r\n- use https://www.conventionalcommits.org/en/v1.0.0/ structure for prs\r\n\r\n**Files**\r\nhttps://github.com/cloudfoundry-incubator/kubecf/blob/master/chart/config/sle15.yaml\r\n\r\nFollow-up of #1086, needed for #1164",
        id: 687381766,
        labels: [
          %{
            color: "e60000",
            default: false,
            description: "",
            id: 1709894520,
            name: "Priority: Critical",
            node_id: "MDU6TGFiZWwxNzA5ODk0NTIw",
            url: "https://api.github.com/repos/cloudfoundry-incubator/kubecf/labels/Priority:%20Critical"
          },
          %{
            color: "f0dc59",
            default: false,
            description: "",
            id: 1934824810,
            name: "Size: 5",
            node_id: "MDU6TGFiZWwxOTM0ODI0ODEw",
            url: "https://api.github.com/repos/cloudfoundry-incubator/kubecf/labels/Size:%205"
          },
          %{
            color: "001500",
            default: false,
            description: "",
            id: 2011893458,
            name: "suse-cap",
            node_id: "MDU6TGFiZWwyMDExODkzNDU4",
            url: "https://api.github.com/repos/cloudfoundry-incubator/kubecf/labels/suse-cap"
          }
        ],
        number: 1262,
        repository_url: "https://api.github.com/repos/cloudfoundry-incubator/kubecf",
        state: "open",
        title: "Update pipelines that bump stemcells and buildpacks to update the new locations",
        updated_at: "2020-09-11T11:12:52Z",
        url: "https://api.github.com/repos/cloudfoundry-incubator/kubecf/issues/1262",
      }
    ]
  end
end
