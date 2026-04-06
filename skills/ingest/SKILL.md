# Ingest Skill — Source Material Processing

## When to Use
When 挚友 sends a new piece of source material (URL, file, or text) and asks to ingest/process/add it to the wiki.

## Flow

### 1. Receive and Download
Identify the source type and fetch content:

| Source Type | How to Fetch |
|---|---|
| Web URL | Use `web_fetch` tool |
| Feishu doc | Use `feishu_fetch_doc` tool (doc_id from URL) |
| PDF file | Use `pdf` tool to analyze |
| Image file | Use `image` tool to analyze |
| Plain text | Direct input from 挚友 |

Save raw content to `ankawiki/raw/`:
- Text → save as `raw/{slugified-title}.md`
- Images → save to `raw/assets/`
- PDFs → save to `raw/`

### 2. Read and Analyze
- Read the full content carefully
- Identify: key entities (people, orgs, products), key concepts, main arguments, data points
- Note any contradictions with existing wiki content

### 3. Discuss with 挚友 (Interactive Mode — Default Behavior)

**This is the default mode in v1.0. Do NOT skip this step.**

Before writing any Wiki pages, present the analysis to 挚友 for discussion:

1. **Present extracted entities**: list people, organizations, products found
2. **Present extracted concepts**: list technologies, theories, methods found
3. **Present key arguments**: core viewpoints and data points from the source
4. **Ask for direction**:
   - "Which of these entities and concepts are you most interested in?"
   - "Did I miss anything important?"
   - "Which direction should I focus on?"
5. **Adjust based on feedback**:
   - Increase depth for topics 挚友 cares about
   - Skip topics 挚友 finds unimportant
   - Create synthesis pages for areas of special interest

> **Design principle**: Karpathy emphasizes "one at a time and stay involved". Ingest is not a black box. The user participates in discussion and guides focus before any wiki writes happen.

### 4. Create Source Summary Page
Create `ankawiki/wiki/sources/{slug}.md`:
- Frontmatter: tags, created date, updated date, source URL
- Summary (1-2 paragraphs)
- Key Takeaways (bullet points)
- Notable Quotes (if any)
- Links to entities and concepts

### 5. Update Entity Pages
For each entity (prioritized by step 3 discussion):
- Existing page → append new info, update summary
- New page → create with frontmatter, mark as stub if incomplete

### 6. Update Concept Pages
Same pattern as entities.

### 7. Create Comparison/Synthesis Pages (if applicable)
- `wiki/comparisons/{slug}.md` or `wiki/synthesis/{slug}.md`

### 8. Update index.md
Add all new pages to the appropriate category.

### 9. Update log.md
```markdown
## [YYYY-MM-DD] ingest | Source Title
- Source: [URL or file path]
- Created: [list of new pages]
- Updated: [list of updated pages]
- Pages affected: [count]
```

### 10. Report
Summarize to 挚友: pages created/updated, interesting findings, contradictions found.

## Naming Convention
- lowercase, hyphenated (e.g., `karpathy-llm-wiki.md`)

## Quality Checklist
- [ ] Raw source saved to `raw/`
- [ ] Source summary page with frontmatter
- [ ] All entities have pages
- [ ] All concepts have pages
- [ ] Cross-references added
- [ ] index.md updated
- [ ] log.md updated
- [ ] No orphan pages
