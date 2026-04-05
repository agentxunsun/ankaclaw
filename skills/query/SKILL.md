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

### 3. Synthesize an Answer
- Combine information from multiple wiki pages
- Always cite sources: note which wiki page(s) the info comes from
- Distinguish between "the wiki says X" and "based on general knowledge, X"
- Present comparisons as tables when appropriate

### 4. Assess for Archival (v1.0 new)

After generating the answer, evaluate whether it should be archived as a wiki page:

| Answer Type | Archive? | Target Directory |
|---|---|---|
| Multi-source synthesis | Yes | `wiki/synthesis/` |
| Comparison of entities/concepts | Yes | `wiki/comparisons/` |
| Simple factual lookup | No | Keep in chat |
| Yes/no question | No | Keep in chat |
| Correction of wiki error | No, but update the page directly | Update existing page |

### 5. Suggest Archival

If the answer meets archival criteria, append to the response:

> 💡 这个回答综合了多篇 wiki 内容，是否归档为 Wiki 页面？建议标题：《xxx》

Wait for 挚友's confirmation before creating the page.

### 6. Execute Archival (after confirmation)

1. Create page in appropriate directory with frontmatter:
   ```markdown
   ---
   tags: [synthesis]
   created: YYYY-MM-DD
   updated: YYYY-MM-DD
   sources: [list referenced wiki page paths]
   triggered_by: query
   ---
   ```
2. Update `index.md`
3. Append to `log.md`
4. Report result

### 7. Report
- Deliver the answer
- Note gaps in wiki revealed by this question
- Suggest new sources or topics to investigate

## Important Rules
- NEVER fabricate information. If the wiki doesn't have it, say so.
- Always cite wiki sources
- Proactively suggest archival for valuable synthesis answers
- Be honest about gaps — say when wiki is incomplete
- If 挚友 asks outside wiki scope, suggest ingesting relevant sources first
