# Lint Skill — Wiki Health Check

## When to Use
When 挚友 asks to lint/check/audit the wiki, or during periodic maintenance.

## Checks

### 1. Contradiction Detection
- Read all pages in each category
- Look for factual contradictions between pages
- Flag: "Page A says X, but Page B says Y about the same topic"
- Auto-fix obvious cases (e.g., outdated info superseded by newer source)
- Report ambiguous cases for 挚友 to decide

### 2. Stale Content
- Check if any pages reference sources that have been superseded
- Check if `updated` dates are very old relative to newer content in the same domain
- Flag pages that might need refreshing

### 3. Orphan Pages
- Find pages with NO inbound links (no other page links to them)
- These should either be linked from relevant pages or considered for removal
- Use `index.md` as the master reference — if it's in index but nothing links to it, it's an orphan

### 4. Missing Pages
- Find all `[[]]` links across the wiki
- Check if each target page actually exists
- Create stub pages for missing targets, or remove broken links

### 5. Missing Cross-References
- Find pages that cover related topics but don't link to each other
- Suggest and add cross-references

### 6. Data Gaps
- Identify topics that are frequently mentioned but lack dedicated pages
- Identify concepts that are referenced but never fully explained
- Suggest what to ingest next

### 7. Frontmatter Consistency
- Verify all pages have valid YAML frontmatter
- Check that `sources` lists are accurate
- Check that `updated` dates reflect actual last edit

## Output

Generate a lint report:

```markdown
# Wiki Lint Report — [YYYY-MM-DD]

## Summary
- Total pages: [count]
- Issues found: [count]
- Auto-fixed: [count]
- Needs review: [count]

## Issues

### [Category: e.g., Contradiction]
- **Page A** vs **Page B**: [description] → [status: auto-fixed / needs review]

### Orphan Pages
- [[path/to/page|Title]] — no inbound links

### Missing Pages
- [[path/to/missing|Referenced Title]] — referenced by [N] pages but doesn't exist

### Missing Cross-References
- [[page-a]] and [[page-b]] cover related topics but don't link to each other

## Suggestions
- [Topics/sources worth ingesting next]
```

## After Lint
- Append to `ankawiki/log.md`
- Apply auto-fixes
- Report to 挚友 with summary and items needing review
