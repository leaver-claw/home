---
name: openclaw-skills
description: OpenClaw skills system documentation
type: reference
originSessionId: e2da2c24-7296-44b7-8901-77a45f065c62
---
# OpenClaw Skills System

## What is a Skill?

A skill is a reusable piece of functionality packaged as a `SKILL.md` file. Skills can be invoked by name in conversations with OpenClaw.

## SKILL.md Format

```markdown
---
name: image-lab
description: Generate or edit images via a provider-backed image workflow
---

# Instructions

Your task is to ...

## Example

...
```

## Frontmatter Fields

| Field | Required | Description |
|---- ----|---- ----|-- ---------|
| `name` | Yes | Skill identifier (slug) |
| `description` | Yes | Brief summary shown in UI |
| `homepage` | No | URL shown in UI |
| `user-invocable` | No | `true|false` (default: true) |
| `disable-model-invocation` | No | `true|false` (default: false) |
| `command-dispatch` | No | `tool` to bypass model |
| `command-tool` | No | Tool name for dispatch |
| `metadata` | No | Single-line JSON object |

## Metadata Schema

```json5
metadata:
  {
    "openclaw": {
      "requires": {
        "bins": ["uv", "ffmpeg"],
        "env": ["GEMINI_API_KEY"],
        "config": ["browser.enabled"]
      },
      "primaryEnv": "GEMINI_API_KEY",
      "os": ["darwin", "linux", "win32"],
      "install": [
        { "kind": "brew", "formula": "gemini-cli" },
        { "kind": "npm", "package": "@openclaw/acpx" }
      ]
    }
  }
```

## Skills Locations (Priority Order)

1. Workspace: `~/.openclaw/workspace/skills/<skill>/SKILL.md`
2. Local: `./skills/<skill>/SKILL.md` (project-local)
3. Bundled: Built-in skills

## Using Skills in Code

- `{baseDir}` is injected as environment variable
- Skill folder path available for file references
- Environment variables per agent run

## ClawHub Registry

**Search**: `clawhub search "query"` (vector search)
**Install**: `openclaw skills install <skill-slug>`
**Publish**: `clawhub skill publish <path> --slug <slug> --version <semver>`

## Published Skills

- 13,000+ community skills available
- Semver-based versioning with changelogs
- Tags like `latest` point to specific versions
- Security: GitHub accounts ≥1 week old to publish
