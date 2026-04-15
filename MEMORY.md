# MEMORY.md - C2's Long-Term Memory

## GitHub Repository Workflow (Updated: 2026-04-15)

### Authentication & Setup
- GitHub CLI (`gh`) is authenticated via SSH with the `leaver-claw` account.
- Verify with `gh auth status` (must show `repo` scopes).
- Repository root: `/Users/leaver/home`
- Git user (for commits): `Claw Leaver <leaver.claw@gmail.com>`

### Standard PR Workflow
1. **Checkout new branch:** `git checkout -b <feature-branch-name>`
2. **Make changes** to files in the workspace
3. **Stage & commit:** `git add . && git commit -m "descriptive message"`
4. **Push branch:** `git push -u origin <branch-name>`
5. **Create PR:** 
   ```
   gh pr create \
     --title "<title>" \
     --body "<description>" \
     --base master \
     --head <branch-name> \
     --reviewer leaver2000
   ```
   - Always use `--base master` (not `main`)
   - Always include `@leaver2000` as reviewer (Jason's collaborator account)

### Notes
- If PR creation fails with "no commits between main/branch", the remote branch may not exist yet — push first.
- If `cd /Users/leaver/home` fails, verify the directory exists and contains `.git/`.
- When re-running workflow, ensure the branch name is unique to avoid conflicts.
