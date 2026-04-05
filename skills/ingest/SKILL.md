# Ingest Skill — Source Material Processing

## When to Use
When 挚友 sends a new piece of source material (document link, URL, file, or text) and asks to ingest/process/add it to the wiki.

## Flow

### 1. Receive and Download
Identify the source type and fetch content:

| Source Type | How to Fetch |
|---|---|
| Feishu doc URL | Use `feishu_fetch_doc` tool |
| Web URL | Use `web_fetch` tool |
| PDF file | Use `pdf` tool to analyze |
| Image file | Use `image` tool to analyze |
| Feishu message attachment | Download via `feishu_im_bot_image` then process |

Save raw content to `ankawiki/raw/`:
- Text → save as `raw/{slugified-title}.md`
- Images → save to `raw/assets/`
- PDFs → save to `raw/`

### 2. Read and Analyze
- Read the full content carefully
- Identify: key entities (people, orgs, products), key concepts, main arguments, data points
- Note any contradictions with existing wiki content

### 3. Create Source Summary Page
Create `ankawiki/wiki/sources/{slug}.md`:
- Frontmatter with tags, dates, source URL/path
- Summary section (1-2 paragraphs)
- Key Takeaways (bullet points)
- Notable Quotes (if any)
- Links to entities and concepts mentioned

### 4. Update Entity Pages
For each entity mentioned:
- If entity page exists (`wiki/entities/{slug}.md`): append new information, update summary if needed
- If entity page doesn't exist: create it with info from this source + mark as stub if incomplete
- Add `[[sources/{source-slug}|Source Title]]` to the entity's sources list

### 5. Update Concept Pages
Same pattern as entities, but for concepts/ideas/technologies.

### 6. Create Comparison/Synthesis Pages (if applicable)
If the source compares things or provides a synthesis that spans multiple topics:
- Create `wiki/comparisons/{slug}.md` or `wiki/synthesis/{slug}.md`

### 7. Update index.md
Add all new pages to the appropriate category in `ankawiki/index.md`.

### 8. Update log.md
Append an entry:
```markdown
## [YYYY-MM-DD] ingest | Source Title
- Source: [URL or file path]
- Created: [list of new pages]
- Updated: [list of updated pages]
- Pages affected: [count]
```

### 9. Report to 挚友
Summarize what was ingested and what pages were created/updated. Mention any interesting findings or contradictions with existing wiki content.

## Naming Convention
- File names: lowercase, hyphenated, descriptive (e.g., `karpathy-llm-wiki.md`)
- Slugs derived from title: remove articles, use key words

## Quality Checklist
- [ ] Raw source saved to `raw/`
- [ ] Source summary page created with frontmatter
- [ ] All mentioned entities have pages (created or updated)
- [ ] All mentioned concepts have pages (created or updated)
- [ ] Cross-references (`[[]]` links) are valid
- [ ] index.md updated
- [ ] log.md appended
- [ ] No orphan pages created (everything linked from somewhere)
