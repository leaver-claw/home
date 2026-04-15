# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

`myclaw` is a personal OpenClaw workspace and configuration repository. It contains no application source code — its primary content is `.claude/` memory files that document the OpenClaw local-first AI assistant ecosystem.

## Local Network

Three machines on the same LAN:

| Machine | Role | Notes |
|---------|------|-------|
| **DGX Spark** (`192.168.68.68`) | Inference server | GB10 SoC, 128 GB unified memory; runs Ollama on port `11434` |
| **Mac Mini** (this machine) | OpenClaw host | M4 chip; runs the OpenClaw gateway and daemon |
| **Windows/WSL PC** | Development workstation | Main dev machine |

### DGX Inference Endpoint

Base URL: `http://192.168.68.68:11434` (OpenAI-compatible via Ollama)

Currently available models:

| Model | ID |
|-------|----|
| Qwen3 Coder Next | `qwen3-coder-next:q4_K_M` |
| Gemma 4 2B | `gemma4:e2b` |
| Gemma 4 4B | `gemma4:e4b` |
| Gemma 4 (latest) | `gemma4:latest` |
| Nemotron 3 Super 120B | `nemotron-3-super:120b` |

To point OpenClaw at the DGX, set `agent.model` to one of the above IDs and configure the provider URL in `~/.openclaw/openclaw.json`. For Lobster workflows, set `OPENCLAW_URL=http://192.168.68.68:11434`.

## OpenClaw Overview

OpenClaw is a local-first personal AI assistant that connects to 25+ messaging channels and runs on personal devices. Key components:

- **Gateway** — WebSocket control plane at `ws://127.0.0.1:18789`, configured via `~/.openclaw/openclaw.json`
- **Pi Agent Runtime** — RPC-based agent with streaming; supports Pi, Claude, Codex, and other agent types
- **Nodes** — Device-local clients (macOS, iOS, Android) with access to device features
- **ACP (Agent Client Protocol)** — JSON-RPC 2.0 protocol for editor–agent communication

## Key CLI Tools

```bash
# OpenClaw daemon
openclaw onboard --install-daemon
openclaw doctor [--fix]

# ACP headless client
acpx pi 'task description'
acpx openclaw exec 'summarize this'
acpx codex sessions list

# Lobster workflow engine
lobster run path/to/workflow.lobster
lobster graph --format mermaid

# ClawHub skill registry
clawhub search "query"
clawhub skill publish <path> --slug <slug> --version <semver>
openclaw skills install <skill-slug>
```

## Configuration

Primary config at `~/.openclaw/openclaw.json`. Relevant fields:
- `agent.model` — default LLM (e.g. `claude-sonnet-4-6`)
- `gateway.port` — default `18789`
- `channels.<provider>` — messaging channel credentials
- `cron` / `hooks` — scheduled tasks and webhooks
- `dmPolicy` — DM trust mode (`pairing` | `allowlist` | `open` | `disabled`)

## Skills

Skills are `SKILL.md` files with YAML frontmatter (`name`, `description`) followed by instruction markdown. Resolution order:
1. `~/.openclaw/workspace/skills/<skill>/SKILL.md`
2. `./skills/<skill>/SKILL.md` (project-local)
3. Bundled built-ins

## Integrations

### Discord
Already configured in `~/.openclaw/openclaw.json`. Five agents are bound to specific Discord channels:

| Agent | Emoji | Discord Channel ID |
|-------|-------|--------------------|
| Stormy | ⛈️ | `1486404746741809193` |
| C2 | 🎯 | `1486404768560844901` |
| Reacher | 🔍 | `1486404768292274277` |
| Dev | 💻 | `1486404768397004820` |
| Lex | 📄 | `1486404768422170644` |

Guild ID: `1484566649607688395`. Policy is `open`, mentions not required.

### Brave Search
Configured as the default web search provider (`tools.web.search.provider: "brave"`). Reads the API key from the `BRAVE_API_KEY` environment variable. To activate, set:
```bash
export BRAVE_API_KEY="your-key-here"
```
Get a key at https://brave.com/search/api/ (free tier available).

### GitHub Copilot
Auth profile `github-copilot:github` is already present in the config. If the token ever expires, re-authenticate with:
```bash
openclaw models auth login-github-copilot
```
To use a Copilot model as the default: set `agents.defaults.model.primary` to e.g. `"github-copilot/gpt-4o"`.

## Memory Files

The `.claude/` directory holds reference memory files for the OpenClaw ecosystem:
- `openclaw-architecture.md` — system components and integration patterns
- `openclaw-gateway-api.md` — WebSocket API method reference
- `openclaw-skills.md` — skills format, registry, and publishing
- `openclaw-lobster.md` — Lobster workflow engine and step types
- `openclaw-acpx.md` — `acpx` CLI usage and session management
- `openclaw-installation.md` — installation and initial setup
