# Implement Plan

You are tasked with implementing an approved technical plan from `components/draft_orders/docs/plans/`. These plans contain phases with specific changes and success criteria.

## Getting Started

When given a plan path:
- Read the plan completely and check for any existing checkmarks (- [x])
- Read the original ticket and all files mentioned in the plan
- **Read files fully** - never use limit/offset parameters, you need complete context
- Think deeply about how the pieces fit together
- Create a todo list to track your progress
- Start implementing if you understand what needs to be done

If no plan path provided, respond with:
```
I'll help you implement a technical plan. Please provide the path to the plan document you'd like me to implement.

Example: `/implement components/draft_orders/docs/plans/2025-01-14-improve-error-handling.md`
```

## Implementation Philosophy

Plans are carefully designed, but reality can be messy. Your job is to:
- Follow the plan's intent while adapting to what you find
- Implement each phase fully before moving to the next
- Verify your work makes sense in the broader codebase context
- Update checkboxes in the plan as you complete sections

When things don't match the plan exactly, think about why and communicate clearly. The plan is your guide, but your judgment matters too.

If you encounter a mismatch:
- STOP and think deeply about why the plan can't be followed
- Present the issue clearly:
  ```
  Issue in Phase [N]:
  Expected: [what the plan says]
  Found: [actual situation]
  Why this matters: [explanation]

  How should I proceed?
  ```

## Verification Approach

After implementing a phase:
- Run the success criteria checks (usually `make check test` covers everything)
- Fix any issues before proceeding
- Update your progress in both the plan and your todos
- Check off completed items in the plan file itself using Edit
- **Pause for human verification**: After completing all automated verification for a phase, pause and inform the human that the phase is ready for manual testing. Use this format:
  ```
  Phase [N] Complete - Ready for Manual Verification

  Automated verification passed:
  - [List automated checks that passed]

  Please perform the manual verification steps listed in the plan:
  - [List manual verification items from the plan]

  Let me know when manual testing is complete so I can proceed to Phase [N+1].
  ```

If instructed to execute multiple phases consecutively, skip the pause until the last phase. Otherwise, assume you are just doing one phase.

Do not check off items in the manual testing steps until confirmed by the user.

## Progress Tracking

Use TodoWrite to create a structured task list that mirrors the plan's phases:
1. Read and understand plan
2. Implement Phase 1
3. Run Phase 1 automated verification
4. Wait for Phase 1 manual verification
5. Implement Phase 2
6. Run Phase 2 automated verification
7. Wait for Phase 2 manual verification
(etc.)

Update todos as you progress, keeping exactly ONE task in_progress at a time.

## If You Get Stuck

When something isn't working as expected:
- First, make sure you've read and understood all the relevant code
- Consider if the codebase has evolved since the plan was written
- Present the mismatch clearly and ask for guidance

Use sub-tasks sparingly - mainly for targeted debugging or exploring unfamiliar territory.

## Resuming Work

If the plan has existing checkmarks:
- Trust that completed work is done
- Pick up from the first unchecked item
- Verify previous work only if something seems off

## Best Practices

1. **Read Everything First**: Never start coding until you've read the entire plan and all referenced files
2. **Test Incrementally**: Run tests after each significant change, not just at phase end
3. **Document Deviations**: If you must deviate from the plan, document why in comments
4. **Maintain Context**: Keep the original goal in mind, don't get lost in implementation details
5. **Communicate Clearly**: When pausing for manual verification, be explicit about what needs testing

Remember: You're implementing a solution, not just checking boxes. Keep the end goal in mind and maintain forward momentum.