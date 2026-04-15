---
name: openclaw-architecture
description: OpenClaw system architecture and integration patterns
type: reference
originSessionId: e2da2c24-7296-44b7-8901-77a45f065c62
---
# OpenClaw Architecture Overview

OpenClaw is a local-first personal AI assistant that runs on your devices and connects to 25+ messaging channels.

## Core Components

### 1. Gateway (Control Plane)
- WebSocket API at `ws://127.0.0.1:18789`
- Manages sessions, channels, tools, cron jobs, and webhooks
- Provides HTTP health check at `/healthz`
- Configurable via `~/.openclaw/openclaw.json`

### 2. Pi Agent Runtime
- RPC-based agent with streaming support
- Supports multiple agent types (Pi, Claude, Codex, etc.)
- Handles tool execution with progress streaming

### 3. Nodes
- Device-local clients (macOS, iOS, Android)
- Access device features (camera, screen, notifications)
- Can run locally even when gateway is offline

### 4. ACP (Agent Client Protocol)
- Standardized communication between editors and agents
- JSON-RPC based
- Supports stateful sessions, prompt queuing, cooperative cancel

## Integration Options

### Gateway WebSocket API
Direct WebSocket connection for:
- Session management (create, list, activate)
- Prompt submission with streaming responses
- Tool execution
- Event handling

### ClawHub Skill Registry
Package and distribute skills:
- `clawhub skill publish <path> --slug <slug> --version <semver>`
- Vector search via `clawhub search "query"`
- Install via `openclaw skills install <skill-slug>`

### ACP Client (acpx)
Headless CLI for ACP-compatible agents:
```bash
acpx pi 'task description'
acpx codex 'fix failing tests'
acpx openclaw exec 'summarize this'
```

### Lobster Workflows
Typed JSON pipelines for automation:
```yaml
name: jacket-advice
steps:
  - id: fetch
    run: weather --json ${location}
  - id: confirm
    approval: Want jacket advice?
```

## Configuration

**Primary config**: `~/.openclaw/openclaw.json`
- `agent.model`: Default LLM model
- `channels.<provider>`: Channel credentials
- `gateway.port`, `gateway.auth`: Gateway settings
- `cron`: Scheduled tasks
- `hooks`: Webhook configurations

## Security Model
- DMs treated as untrusted by default
- `dmPolicy` modes: `pairing`, `allowlist`, `open`, `disabled`
- Sandbox non-main sessions with Docker
- No OAuth/token management (Lobster runs local-first)

## Related Projects
- **openclaw/openclaw**: Main runtime
- **openclaw/clawhub**: Skill registry
- **openclaw/acpx**: ACP CLI client
- **openclaw/lobster**: Workflow engine
- **openclaw/docs**: Documentation
