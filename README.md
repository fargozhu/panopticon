# Panopticon

# GitHub API client

## mix.exs

```
def deps do
  [{:tentacat, "~> 2.0"}]
end
```

## sample code

### Get all the issues both open and with a specific label 
```
iex(5) client = Tentacat.Client.new(%{access_token: ""})

iex(5)> Tentacat.Issues.filter client, "cloudfoundry-incubator", "kubecf", %{"state" => "open", "labels" => "suse-cap"}
```