# Catch Up

Silently load current branch changes into context by reading old and new versions of all modified files.

1. Run `gt branch info`, extract parent branch from "Parent: " line. If no parent: "Error: Could not identify parent branch. Are you in a Graphite stack?"
2. Get all changed files: `git diff --name-only <parent>..HEAD && git diff --name-only --cached && git diff --name-only` then dedupe the list
3. For each file: run `git show <parent>:<file>` and Read the output (skip if new file or binary)
4. For each file: Read current version from working directory (skip if deleted)
5. Produce no output to user when complete

**CRITICAL**: Always Read entire files - never use limit/offset parameters.
