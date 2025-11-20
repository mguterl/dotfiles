# copy

Copy your last response to the user's clipboard.

## Your Task

Execute the following command to copy your most recent response to the clipboard:

```bash
printf '%s' "YOUR_LAST_RESPONSE" | pbcopy
```

Replace YOUR_LAST_RESPONSE with the actual content of your previous response in this conversation.

## Important Notes

- Use `printf '%s'` to preserve the exact formatting without adding newlines
- The response should be copied exactly as you provided it, including any code blocks, formatting, etc.
- After copying, confirm that the response has been copied to the clipboard