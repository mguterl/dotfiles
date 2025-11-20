# merge-conflict

You are helping to resolve merge conflicts in the codebase. Follow these steps carefully:

## Your Task

1. **Identify all files with merge conflicts**
   - Run `git status` to see the list of conflicted files
   - Look for files marked as "both modified" or "unmerged"
   - Use grep to find conflict markers: `grep -r "<<<<<<< HEAD" .`

2. **Review each conflict systematically**
   - For each conflicted file:
     - Read the entire file to understand the context
     - Examine both versions of the conflicting code:
       - The current branch version (between `<<<<<<< HEAD` and `=======`)
       - The incoming version (between `=======` and `>>>>>>>`)
     - Understand what each side is trying to accomplish
     - Consider the intent and purpose of both changes

3. **Resolve conflicts thoughtfully**
   - **If the resolution is clear:**
     - Choose the appropriate resolution:
       - Keep one version if it's clearly correct
       - Combine both changes if they're complementary
       - Rewrite the section if needed to incorporate both intents
   - **If the resolution is unclear:**
     - Present both versions to the user
     - Explain what each version does
     - Ask for guidance on which approach to take
   - Remove ALL conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`)
   - Ensure the resolved code is syntactically correct and logically sound

4. **Verify your changes**
   - After resolving ALL conflicts, run:
     ```bash
     dev style --include-branch-commits -a && dev typecheck && dev test --include-branch-commits
     ```
   - Fix any style, type, or test errors that arise
   - Re-run verification until all checks pass

## Important Rules

- **ALLOWED:** `git status` to check conflict status
- **DO NOT** run git commands that alter state (add, commit, merge, rebase, etc.)
- **DO** ask the user for clarification when the correct resolution is ambiguous
- **DO** focus solely on resolving the conflicts in the code
- **DO** ensure all conflict markers are removed
- **DO** maintain code consistency and quality
- **DO** run the verification commands to ensure correctness

## Best Practices

- Read surrounding code to understand the context
- Preserve the intent of both conflicting changes when possible
- Maintain consistent code style with the rest of the file
- Consider the impact on other parts of the codebase
- When in doubt, explain the options and ask for guidance
- Pay attention to:
  - Import statements that may have been added in both branches
  - Function signatures that may have changed differently
  - New features vs bug fixes that may need to coexist

The user will handle all git operations after you've successfully resolved the conflicts and verified the changes.