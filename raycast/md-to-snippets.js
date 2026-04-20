#!/usr/bin/env node

const fs = require("fs");
const path = require("path");

const inputFile = path.join(__dirname, "snippets.md");
const outputJson = path.join(__dirname, "snippets.json");
const outputTable = path.join(__dirname, "snippets-table.md");

const content = fs.readFileSync(inputFile, "utf8");

const blocks = content.split(/\n---\n/).map((b) => b.trim()).filter(Boolean);

const snippets = blocks.map((block) => {
  const lines = block.split("\n");

  const nameLine = lines.find((l) => l.startsWith("## "));
  if (!nameLine) throw new Error(`Missing ## name in block:\n${block}`);
  const name = nameLine.slice(3).trim();

  const keywordLine = lines.find((l) => l.startsWith("keyword:"));
  if (!keywordLine) throw new Error(`Missing keyword: in block:\n${block}`);
  const keyword = keywordLine.slice("keyword:".length).trim();

  const descriptionLine = lines.find((l) => l.startsWith("description:"));
  const description = descriptionLine
    ? descriptionLine.slice("description:".length).trim()
    : "";

  const metaLines = new Set([nameLine, keywordLine, descriptionLine].filter(Boolean));
  const textStartIndex = lines.findIndex((l) => !metaLines.has(l) && l !== "");
  const text = lines.slice(textStartIndex).join("\n").trim();

  return { keyword, text, name, description };
});

// Generate snippets.json (Raycast format — no description field)
const jsonSnippets = snippets.map(({ keyword, text, name }) => ({ keyword, text, name }));
fs.writeFileSync(outputJson, JSON.stringify(jsonSnippets, null, 2) + "\n");
console.log(`Wrote ${jsonSnippets.length} snippets to ${outputJson}`);

// Generate snippets-table.md grouped by "Group: Title" prefix
const groups = {};
for (const { name, keyword, description } of snippets) {
  const colonIndex = name.indexOf(":");
  const group = colonIndex !== -1 ? name.slice(0, colonIndex).trim() : "Other";
  const title = colonIndex !== -1 ? name.slice(colonIndex + 1).trim() : name;
  if (!groups[group]) groups[group] = [];
  groups[group].push({ title, keyword, description });
}

const tableSections = Object.entries(groups).map(([group, items]) => {
  const rows = items
    .map(({ title, keyword, description }) => `| ${title} | \`${keyword}\` | ${description} |`)
    .join("\n");
  return `## ${group}\n\n| Name | Keyword | Description |\n|------|---------|-------------|\n${rows}`;
});

const table = `# Snippets\n\n${tableSections.join("\n\n")}\n`;

fs.writeFileSync(outputTable, table);
console.log(`Wrote snippets table to ${outputTable}`);
