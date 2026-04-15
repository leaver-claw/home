---
name: openclaw-acpx
description: OpenClaw ACP client (acpx) documentation
type: reference
originSessionId: e2da2c24-7296-44b7-8901-77a45f065c62
---
# ACP Client (acpx)

`acpx` is a headless CLI client for the Agent Client Protocol (ACP).

## Installation

```bash
npm install -g acpx@latest
```

## Built-in Agents

| Agent | Command |
|---- ----|---- ----|
| Pi | `acpx pi` |
| OpenClaw | `acpx openclaw` |
| Codex | `acpx codex` |
| Claude | `acpx claude` |
| Gemini | `acpx gemini` |
| Cursor | `acpx cursor` |
| Copilot | `acpx copilot` |

## Quick Start

```bash
# Run a single prompt
acpx pi 'review recent changes'
acpx codex 'fix the failing tests'

# Named sessions for parallel workstreams
acpx pi -s research 'research options'
acpx pi -s implementation 'implement feature'
```

## Session Management

```bash
# Create session
acpx codex sessions new

# Idempotent ensure
acpx codex sessions ensure

# List sessions
acpx codex sessions list

# Show session info
acpx codex sessions show

# View history
acpx codex sessions history

# Check status
acpx codex status
```

## Flows

```bash
acpx flow run ./my-flow.ts --input-file ./flow-input.json
```

Flow files support:
- `acp` steps
- `action` steps
- `compute` steps
- `checkpoint` steps

## Output Formats

| Format | Description |
|---- ----|---- ----|
| `text` | Plain text output (default) |
| `json` | JSON with metadata |
| `json-strict` | Pure JSON response |
| `quiet` | Minimal output |

## Features

- **Persistent sessions** - multi-turn conversations scoped per repo
- **Named sessions** - parallel workstreams
- **Prompt queueing** - submit while another runs
- **Cooperative cancel** - `acpx codex cancel`
- **Soft-close** - close without deleting history
- **Crash reconnect** - auto-detect dead agents

## Configuration

- Global: `~/.acpx/config.json`
- Project: `<cwd>/.acpxrc.json`
