## AI: Reverse Prompt
keyword: ;;air
description: Asks AI to reconstruct the ideal prompt based on the current result.

Look back at this entire conversation. Based on the corrections I made and the output I accepted in the final turn, write a single self-contained prompt that would have produced that output on the first try. Use labeled blocks: PERSONA, TASK, CONTEXT, FORMAT, CONSTRAINTS. Include only instructions that are load-bearing — leave out anything I never enforced.

---

## AI: Simplified Reverse Prompt
keyword: ;;aisr
description: Simplified version of the Reverse Prompt snippet that focuses on reconstructing the ideal prompt based on the current result.

Build a prompt in the way I should have given it to you in the beginning to get the current result.

---

## English: Review & provide a more natural way to say it
keyword: ;;eni
description: Reviews clipboard text for mistakes and suggests a more natural phrasing.

Review the mistakes and suggest a more natural phrasing if possible:
"{clipboard}"

Explain the changes. Point out relevant grammar topics to prevent these mistakes.

If no mistakes are found and it's already sounding natural, just say "No mistakes found. It is already natural."

---

## English: 10 natural alternatives
keyword: ;;eno
description: Generates 10 natural alternative phrasings for the clipboard text.

Give me 10 natural alternatives for: 
"{clipboard}"

---

## English: Grammar check
keyword: ;;eng
description: Fixes grammar mistakes in the clipboard text and explains the changes.

Fix grammar mistakes and explain the changes: 
"{clipboard}"

If no mistakes are found, just say "No mistakes found."

---

## My: Email address
keyword: ;;em
description: Expands to my personal email address.

oleh.baranovskyi.dev.acc@gmail.com

---

## Git: Push All Changes
keyword: ;;gp
description: Stages all changes, commits with a prompted message, and pushes.

git add . && git commit -m "{argument name=\"message\"}" && git push && exit

---

## Git: Ai Push All Changes
keyword: ;;aigp
description: Stages all changes, generates a commit message with AI based on the diff, commits, and pushes.

claude -p "/gacp"

---
