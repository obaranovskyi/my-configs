# Raycast Snippets

Edit snippets in `snippets.md`, then generate `snippets.json` for Raycast import.

## Usage

1. Edit `snippets.md`
2. Run the conversion script:
   ```sh
   node md-to-snippets.js
   ```
3. Import `snippets.json` into Raycast: **Raycast → Snippets → Import**

## Snippet format

Each snippet in `snippets.md` follows this structure:

```
## Snippet Name
keyword: ;;trigger
description: What this snippet does.

Text content goes here.
Multiline content is supported.

---
```

- `## Snippet Name` — display name shown in Raycast
- `keyword: ;;trigger` — abbreviation that expands the snippet
- `description:` — used to generate `snippets-table.md` (not included in Raycast JSON)
- Text body — everything after the meta lines until `---`
- `---` — separator between snippets

## Raycast variables

Use these placeholders inside the text body:

| Placeholder | Description |
|---|---|
| `{clipboard}` | Current clipboard content |
| `{argument name="label"}` | Prompts for user input with the given label |
| `{cursor}` | Positions cursor after expansion |
