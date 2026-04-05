# Query Skill — Knowledge Retrieval and Answering

## When to Use
When 挚友 asks a question that should be answered from the wiki's knowledge.

## Flow

### 1. Understand the Question
- Identify what 挚友 is really asking
- Determine scope: specific entity? concept comparison? synthesis of multiple sources?

### 2. Search the Wiki
1. Read `ankawiki/index.md` to find relevant pages
2. Read the relevant pages fully
3. Follow cross-references (`[[]]` links) to related pages
4. If needed, read source pages in `wiki/sources/` for detailed context

### 3. Synthesize Answer
- Combine information from multiple pages
- Always cite which wiki page(s) the info comes from
- If information is incomplete, say so explicitly
- Format based on question type:
  - Simple fact → direct answer with citation
  - Comparison → table format
  - Analysis → structured prose with headings
  - List → bullet points

### 4. Archive Valuable Answers
If the answer is substantive (not a simple lookup):
- Create a new wiki page in the appropriate directory
- Add it to `index.md`
- Append to `log.md`
- This is how explorations compound in the knowledge base

### 5. Report
- Deliver the answer clearly
- Note any gaps in the wiki that this question revealed
- Suggest new sources or topics to investigate if relevant

## Important Rules
- NEVER fabricate information. If the wiki doesn't contain it, say so.
- If the answer requires info NOT in the wiki, clearly mark it as external knowledge
- Always distinguish between "the wiki says X" and "based on my training data, X"
- If 挚友 asks something outside wiki scope, acknowledge and suggest ingesting relevant sources first
