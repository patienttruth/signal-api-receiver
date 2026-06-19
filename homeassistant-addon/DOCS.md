# Signal API Receiver - Home Assistant Add-on

## Overview

This add-on runs [signal-api-receiver](https://github.com/kalbasit/signal-api-receiver) as a Home Assistant add-on, allowing Home Assistant to receive Signal messages and trigger automations.

It works alongside the [signal-cli-rest-api](https://github.com/bbernhard/signal-cli-rest-api) add-on (which must be running in `json-rpc` mode).

## Prerequisites

- The **Signal Messenger** add-on must be installed and running in `json-rpc` mode
- You must have a registered Signal account number

## Configuration

### Option: `signal_api_url`

The WebSocket URL of your `signal-cli-rest-api` instance. Use `ws://` for local connections.

Example: `ws://localhost:8080` or `ws://100.x.x.x:8080`

### Option: `signal_account`

Your Signal account phone number in E.164 format (e.g. `+1888777444`).

### Option: `server_address`

The address and port the REST API will listen on inside the container. Default is `:8105`.

### Option: `repeat_last_message`

If `true`, the `/receive/pop` endpoint will repeat the last message when no new messages are available. Default is `false`.

### Option: `record_message_type`

Which message types to record. Valid values:
- `data-message` (default) — standard Signal messages
- `receipt` — read/delivery receipts
- `typing` — typing indicators
- `data` — raw data messages
- `sync` — sync messages

### Option: `log_level`

Logging verbosity. Valid values: `trace`, `debug`, `info`, `warning`, `error`, `fatal`. Default is `info`.

## API Endpoints

Once running, the following endpoints are available on port 8105:

- `GET /receive/pop` — Returns one message at a time; returns `204 No Content` if queue is empty
- `GET /receive/flush` — Returns all queued messages as a list
- `GET /healthz` — Health check endpoint

## Home Assistant Automation Example

```yaml
automation:
  - alias: "Receive Signal Message"
    trigger:
      - platform: rest
        resource: http://localhost:8105/receive/pop
        method: GET
        scan_interval: 10
    condition:
      - condition: template
        value_template: "{{ trigger.status_code == 200 }}"
    action:
      - service: notify.notify
        data:
          message: "Received: {{ trigger.json.envelope.dataMessage.message }}"
```
