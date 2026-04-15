---
name: openclaw-gateway-api
description: OpenClaw Gateway WebSocket API reference
type: reference
originSessionId: e2da2c24-7296-44b7-8901-77a45f065c62
---
# OpenClaw Gateway API

## Connection

```javascript
const ws = new WebSocket('ws://127.0.0.1:18789');
```

The gateway runs on port `18789` by default. Health check: `GET /healthz`

## Protocol

ACP uses JSON-RPC 2.0 format:

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "session/list",
  "params": {}
}
```

## Core Methods

### Session Management

| Method | Description |
|--------|-------------|
| `session/list` | List all sessions (stabilized) |
| `session/new` | Create a new session |
| `session/load` | Load an existing session |
| `session/activate` | Activate a session |
| `session/close` | Close a session |
| `session/delete` | Delete a session |
| `session/fork` | Fork an existing session |
| `session/resume` | Resume a session |

### Prompt Exchange

| Method | Description |
|--------|-------------|
| `prompt/post` | Submit a prompt to the agent |
| `prompt/queue` | Queue a prompt (non-blocking) |
| `session/cancel` | Cancel current operation |

### Configuration

| Method | Description |
|--------|-------------|
| `config/apply` | Replace entire config |
| `config/patch` | Patch partial config |
| `config/get` | Get config value |
| `config/schema/lookup` | Inspect schema |

## Notifications

| Notification | Description |
|--------------|-------------|
| `session_info_update` | Session state changes |
| `prompt_progress` | Prompt processing updates |
| `prompt_response` | Final response received |
| `tool_call` | Agent wants to use a tool |
| `tool_result` | Tool execution result |

## Session Modes

- `main`: Direct chat sessions
- `per-peer`: One session per conversation partner
- `per-channel-peer`: Per channel + peer
- `per-account-channel-peer`: Per account + channel + peer

## ACP Libraries

Available in: TypeScript, Rust, Python, Java, Kotlin

Registry: https://github.com/agentclientprotocol/registry
