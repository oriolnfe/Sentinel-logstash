# Sentinel logstash docker

A dockerized logstash instance that is prepared for sending JSON log files that can be analized with an Azure Log Analytics and Azure Sentinel.

## Prerequisites

Having an Azure Sentinel instance deployed.

## How to run

First of all, the logstash/logstash.conf must be changed with the following variables:

```yaml
workspace_id => "$WORKSPACE_ID" 
workspace_key => "$WORKSPACE_KEY"
```

These values can be found on the Azure Portal: Log Analytics workspaces -> Workspace name -> Agents management.

Additionally, JSON datasets shall be located on the datasets/ directory.

After these changes, the only steps necessary are running the following commands:

```Bash
sudo docker build -t logstash-sentinel .
sudo docker run --rm -it logstash-sentinel
```
