# Lint Skill — Wiki Health Check

## When to Use
When 挚友 asks to lint/check/audit the wiki, or during periodic maintenance.

## Checks

### 1. Contradiction Detection
- Read all pages in each category
- Look for factual contradictions between pages
- Flag: "Page A says X, but Page B says Y about the same topic"
- Auto-fix obvious cases

### 2. Orphan Pages
- Pages that exist but have NO inbound links from other wiki pages
- These are unreachable via cross-referencing
- Use `tools/check-links.sh` for automated detection

### 3. Missing Pages
- `[[]]` links that point to non-existent files
- Referenced entities/concepts without dedicated pages

### 4. Missing Cross-References
- Pages covering related topics but not linking to each other

### 5. Frontmatter Consistency
- All pages have: tags, created, updated, sources
- Dates in YYYY-MM-DD format
- Tags match page category (entity, concept, source, etc.)

### 6. Stale Content Detection
- Check if any source page references information that has been superseded by newer sources
- Look for claims marked with dates that may be outdated (e.g., "as of 2024" when newer data exists)
- Flag pages where `updated` date is significantly older than related pages
- Auto-fix: update `updated` field when content is modified

### 7. Knowledge Gap Detection
Identify areas where the wiki is incomplete:

- **Shallow pages**: stub pages with minimal content (fewer than 10 lines of body text) that deserve expansion
- **Missing connections**: topics that overlap but have no cross-reference, suggesting an unexplored relationship
- **Unexplored themes**: subjects frequently mentioned across multiple pages but lacking a dedicated page
- **Concept blank zones**: areas between existing concepts that should have connecting pages
- **Empty categories**: categories (e.g., comparisons/) with zero pages that have potential candidates

For each gap, generate **concrete search suggestions** using this format:

```markdown
### [Gap Type]: [Gap Title]
- 📄 Missing: [what specifically needs to be created]
- 🔍 Suggested search: [2-3 specific keywords]
- 📚 Suggested source type: [article/paper/video/feishu doc]
- 💡 Why valuable: [1 sentence explaining impact]
```

## Output Format

```markdown
# Lint Report — [YYYY-MM-DD]

## Summary
- Pages scanned: [N]
- Issues found: [N]
- Auto-fixed: [N]
- Needs review: [N]
- Knowledge gaps: [N]

## Auto-Fixed Issues
- [Description of what was fixed]

## Issues Needing Review

### Contradictions
- **Page A** vs **Page B**: [description]

### Orphan Pages
- [[path/to/page|Title]] — no inbound links

### Missing Pages
- [[path/to/missing|Title]] — referenced by [N] pages but doesn't exist

### Missing Cross-References
- [[page-a]] and [[page-b]] cover related topics but don't link to each other

### Stale Content
- [[path/to/page|Title]] — [what's outdated and why]

## Knowledge Gaps

### Shallow Pages
- [[path/to/page|Title]] — stub, only [N] lines
  - 📄 Missing: expanded details on [topic]
  - 🔍 Suggested search: [keywords]
  - 💡 Why valuable: [reason]

### Missing Connections
- [[page-a]] ↔ [[page-b]] — related but unlinked
  - 📄 Missing: [what's missing]
  - 🔍 Suggested search: [keywords]
  - 💡 Why valuable: [reason]

### Unexplored Themes
- [Theme] mentioned [N] times but no dedicated page
  - 📄 Missing: dedicated concept/entity page
  - 🔍 Suggested search: [keywords]
  - 📚 Suggested source type: [type]
  - 💡 Why valuable: [reason]

### Empty Categories
- [Category] has 0 pages; potential candidates: [list]
  - 📄 Missing: [specific pages to create]
  - 🔍 Suggested search: [keywords]

## Recommended Next Steps
- Top 3 priority gaps to address via ingest
- Suggested sources to look for
```

## After Lint
1. Append entry to `ankawiki/log.md`
2. Apply all auto-fixes (update files directly)
3. Report to 挚友 with:
   - Summary of fixes applied
   - Issues needing manual review
   - **Top 3 knowledge gaps** (highlighted prominently — these trigger the next ingest cycle)
   - Suggested next sources to ingest
