---
name: openclaw-installation
description: OpenClaw installation and setup guide
type: reference
originSessionId: e2da2c24-7296-44b7-8901-77a45f065c62
---
# OpenClaw Installation & Setup

## Installation

```bash
npm install -g openclaw@latest
openclaw onboard --install-daemon
```

## Configuration File

Location: `~/.openclaw/openclaw.json`

Minimal configuration:
```json5
{
  "agent": {
    "model": "claude-sonnet-4-6"
  },
  "gateway": {
    "port": 18789
  }
}
```

## Hot Reload Modes

- `hybrid`: Default, reloads config on change
- `hot`: Immediate reload
- `restart`: Full restart required
- `off`: No reload

## Verification

```bash
# Check installation
openclaw doctor
openclaw doctor --fix

# Check gateway health
curl http://127.0.0.1:18789/healthz
```

## Gateway Ports

- Default: `18789` (WebSocket)
- Health check: `GET /healthz`

## Security Notes

- Treat inbound DMs as untrusted
- Use `dmPolicy: "pairing"` by default
- Sandbox non-main sessions with Docker
- Use tailscale `serve` (tailnet-only) or `funnel` (public HTTPS) for remote access
