---
name: openclaw-lobster
description: OpenClaw Lobster workflow engine documentation
type: reference
originSessionId: e2da2c24-7296-44b7-8901-77a45f065c62
---
# Lobster Workflow Engine

Lobster is a local-first workflow shell for composable automation.

## Key Concepts

- **Typed pipelines** (JSON-first), not text pipes
- **Local-first execution** - no OAuth/token management
- **Composable macros** - invoke workflows in one step

## Workflow Structure

```yaml
name: jacket-advice
description: Get jacket advice based on weather
args:
  location:
    default: Phoenix
    description: City to check weather for
steps:
  - id: fetch
    run: weather --json ${location}
  - id: confirm
    approval: Want jacket advice?
    stdin: $fetch.json
  - id: analyze
    pipeline:
      llm.invoke:
        model: openclaw
        prompt: |
          Based on weather: {{ stdin }}
          Should I wear a jacket?
    stdin: $confirm.stdout
```

## Step Types

| Type | Description |
|------|---- -------|
| `run:` or `command:` | Execute shell/CLI commands |
| `pipeline:` | Native Lobster stages (e.g., `llm.invoke`) |
| `approval:` | Human approval gates |
| `stdin:` | Pass data between steps (`$step.json` or `$step.stdout`) |
| `when:` or `condition:` | Conditional execution |

## LLM Integration

```yaml
pipeline:
  llm.invoke:
    model: openclaw  # or: pi, http
    provider: openclaw
    prompt: |
      Your instructions here
```

Provider URLs via env vars:
- `OPENCLAW_URL` / `OPENCLAW_TOKEN`
- `LOBSTER_PI_LLM_ADAPTER_URL`
- `LOBSTER_LLM_ADAPTER_URL`

## CLI Commands

```bash
# Run a workflow
lobster run path/to/workflow.lobster

# Visualize as Mermaid diagram
lobster graph --format mermaid

# Other utilities
lobster exec      # Execute shell commands
lobster where     # Find tools
lobster pick      # Select from list
lobster head      # View first lines
lobster json      # Validate/pretty JSON
lobster table     # Display tabular data
lobster approve   # Manual approval
```

## Flow Steps (ACP-compatible)

- `acp`: Agent Client Protocol steps
- `action`: External tool calls
- `compute`: Inline calculations
- `checkpoint`: State snapshots
