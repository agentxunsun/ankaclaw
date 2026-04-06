# Query Skill — Knowledge Retrieval and Answering

## When to Use
When 挚友 asks a question about topics covered in the wiki, or when exploring ideas related to existing knowledge.

## Flow

### 1. Understand the Question
- Parse what 挚友 is really asking
- Identify key terms, entities, and concepts

### 2. Search the Wiki
- Read `ankawiki/index.md` to find relevant pages
- Read each relevant page's content
- Follow cross-references (`[[]]` links) to connected information
- Check `wiki/sources/` for primary source details if needed
- Use `tools/search.sh` for keyword search when index isn't sufficient

### 3. Synthesize an Answer
- Combine information from multiple wiki pages
- Always cite sources: note which wiki page(s) the info comes from
- Distinguish between "the wiki says X" and "based on general knowledge, X"
- Present comparisons as tables when appropriate

### 4. Assess for Archival

After generating the answer, evaluate whether it should be archived:

| Answer Type | Archive? | Target Directory |
|---|---|---|
| Multi-source synthesis | ✅ Yes | `wiki/synthesis/` |
| Comparison of entities/concepts | ✅ Yes | `wiki/comparisons/` |
| New analysis or insight combining wiki pages | ✅ Yes | `wiki/synthesis/` |
| Simple factual lookup (1 source) | ❌ No | Keep in chat |
| Yes/no question | ❌ No | Keep in chat |
| Correction of wiki error | ❌ No, but update the page directly | Update existing page |

### 5. Suggest Archival

If the answer meets archival criteria, append to the response:

> 💡 这个回答综合了多篇 wiki 内容，是否归档为 Wiki 页面？建议标题：《xxx》

Wait for 挚友's confirmation before creating the page.

### 6. Execute Archival (after confirmation)

**One-shot archival** — create page AND update all indexes in one step:

1. Create page in appropriate directory with frontmatter:
   ```markdown
   ---
   tags: [synthesis|comparison]
   created: YYYY-MM-DD
   updated: YYYY-MM-DD
   sources: [list referenced wiki page paths]
   triggered_by: query
   ---

   # [Page Title]

   ## Summary
   [One paragraph]

   ## Details
   [Full answer content]

   ## Related
   - [[path/to/related-page|Display Name]]
   ```

2. Update `ankawiki/index.md` — add entry to appropriate category section

3. Append to `ankawiki/log.md`:
   ```markdown
   ## [YYYY-MM-DD] query → archive | [Title]
   - 触发：挚友查询
   - 归档到：[directory/filename.md]
   - 引用来源：[list source pages]
   - Pages affected: 1 created + index/log updated
   ```

4. Report: "已归档为 [[path|Title]]"

### 7. Report
- Deliver the answer
- Note gaps in wiki revealed by this question
- Suggest new sources or topics to investigate

## Important Rules
- NEVER fabricate information. If the wiki doesn't have it, say so.
- Always cite wiki sources with `[[]]` links
- Proactively suggest archival for valuable synthesis answers
- Be honest about gaps — say when wiki is incomplete
- If 挚友 asks outside wiki scope, suggest ingesting relevant sources first
- When archiving, always complete ALL 3 steps (create page + update index + update log) — never leave partial archives
