# HEARTBEAT.md - Autonomous Tasks

## Regular Checks (run every 30-60 min during active hours)

### 1. Check OpenClaw Gateway Status
- Run: `openclaw gateway status`
- Action if down: `openclaw gateway start`

### 2. Check Repository Status (`/Users/leaver/home`)
- Run: `git status`
- If uncommitted changes: commit with message
- If ahead of remote: push to GitHub

### 3. Check for New PRs or Issues
- Search: `gh pr list --state open`
- Report any new PRs to the #c2 channel

### 4. Monitor Agent Health
- Check if all agents (stormy, c2, reacher, dev, lex) are running
- Report any failures or restart needs

### 5. Quick Weather Check
- Location: Austin, TX
- Report if severe weather or significant changes

---

## Daily Tasks (8:00 PM CT)

### 1. Research Daily Update
- Dispatch Reacher agent to each research area
- Update existing research files with new findings
- Generate summary in `RESEARCH_LOG.md`
- Commit and push to git repo

---

## Weekly Tasks (run every Monday at 9:00 AM CT)

### 1. Weekly Summary
- Review PRs merged last week
- Summarize key developments
- Post to #c2 channel

### 2. Memory Cleanup
- Review and archive old entries in MEMORY.md
- Remove outdated workflow notes

---

## Notes
- Heartbeats run automatically via OpenClaw cron system
- Results sent to the configured Discord channel
- Adjust schedule in OpenClaw config if needed
