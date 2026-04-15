# DAILY_RESEARCH.md - Daily Research Task Template

## Task: Daily Research Dispatch (8:00 PM CT)

### Objectives
1. Dispatch research agent to each research area
2. Update existing research files with new findings
3. Generate summary in RESEARCH_LOG.md
4. Commit and push changes to git repo

### Research Areas
- **Omniverse** → `/Users/leaver/home/research/omniverse/`

### Workflow
1. Read existing research files to understand current state
2. Dispatch Reacher agent to research each area
3. Update existing files with new findings
4. Log summary to RESEARCH_LOG.md with timestamp
5. Commit all changes with descriptive message
6. Push to GitHub

---

## RESEARCH_LOG Format

```markdown
# Research Log

## [Date]

### Agent: Reacher
### Areas Researched: [list]
### Summary:
- New findings for [area]
- Files updated: [list]
- Notes: [any additional context]

---

## Previous entries below...

```

---

## Cron Schedule
```
0 20 * * *  # 8:00 PM CT every day (CST/CDT)
```
