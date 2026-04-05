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

### 3. Missing Pages
- `[[]]` links that point to non-existent files
- Referenced entities/concepts without dedicated pages

### 4. Missing Cross-References
- Pages covering related topics but not linking to each other

### 5. Frontmatter Consistency
- All pages have: tags, created, updated, sources
- Dates in YYYY-MM-DD format
- Tags match page category (entity, concept, source, etc.)

### 6. Knowledge Gap Detection (v1.0 new)
Identify areas where the wiki is incomplete:

- **Shallow pages**: stub pages with minimal content that deserve expansion
- **Missing connections**: topics that overlap but have no cross-reference, suggesting an unexplored relationship
- **Unexplored themes**: subjects frequently mentioned across multiple pages but lacking a dedicated page
- **Concept blank zones**: areas between existing concepts that should have connecting pages

For each gap, generate **concrete search suggestions**:
- 2-3 search keywords per gap
- Suggested source types to look for
- Why filling this gap would be valuable

## Output Format

```markdown
# Lint Report — [YYYY-MM-DD]

## Summary
- Pages scanned: [N]
- Issues found: [N]
- Auto-fixed: [N]
- Needs review: [N]

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

## Knowledge Gaps

### Shallow Pages
- [[path/to/page|Title]] — stub, only [N] lines
  - 💡 Suggested search: [keywords]

### Missing Connections
- [[page-a]] ↔ [[page-b]] — related but unlinked
  - 💡 Gap: [what's missing]
  - 💡 Suggested search: [keywords]

### Unexplored Themes
- [Theme] mentioned [N] times but no dedicated page
  - 💡 Suggested search: [keywords]

## Recommended Next Steps
- [Sources/topics worth ingesting based on gap analysis]
```

## After Lint
- Append to `ankawiki/log.md`
- Apply auto-fixes
- Report to 挚友
- **Highlight knowledge gaps prominently** — these can trigger the next ingest cycle
