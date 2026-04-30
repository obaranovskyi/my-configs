---
name: question
description: Marks the input as a question only — answer and explain, make no file changes.
argument-hint: "<your question>"
---

# /question

Answer the question in `$ARGUMENTS`. This is a read-only session — do not create, edit, or delete any files, do not run any commands that modify state.

## Usage

```
/question $ARGUMENTS
```

## Steps

1. Read `$ARGUMENTS` as the user's question.
2. Answer it directly and concisely.
3. Stop. Do not suggest follow-up edits, do not modify any files, do not run any write commands.
