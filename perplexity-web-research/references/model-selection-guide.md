# Model Selection Guide

Detailed guidance on choosing the right Perplexity model for your research task.

## Quick Selection Flowchart

**Start here**: Use `sonar` by default for most queries.

**Upgrade to `sonar-pro` if**:
- Your initial `sonar` response lacks depth
- Query requires comprehensive coverage across multiple aspects
- You need the largest context window (200k tokens)
- You're explicitly asked for "detailed" or "thorough" research

**Switch to reasoning models if**:
- The query contains "how should I...", "what's the best way...", "analyze..."
- Problem requires step-by-step logical deduction
- Task involves mathematical or algorithmic reasoning

**Use `sonar-deep-research` if**:
- Topic has no consensus or multiple competing approaches
- Research spans 5+ distinct subtopics or perspectives
- The question itself is inherently complex and multi-faceted

## Detailed Model Selection Criteria

### `sonar` (Default Choice)

**Best for**: Quick lookups and general questions

**Context**: 128k tokens
**Web Search**: ✓ Yes

Use when you need straightforward information without extensive analysis.

### `sonar-pro` (Flagship Model)

**Best for**: Thorough answers and detailed research

**Context**: 200k tokens (largest)
**Web Search**: ✓ Yes

**Use `sonar-pro` when**:
- Query requires comprehensive coverage
- Need detailed explanations
- Research involves multiple aspects
- Largest context window needed (200k)

### `sonar-deep-research`

**Best for**: Complex multi-faceted research

**Context**: 128k tokens
**Web Search**: ✓ Yes

**Use `sonar-deep-research` when**:
- Topic is complex and multi-faceted
- Need synthesis across many sources
- Research question has no simple answer
- Multiple perspectives must be considered

### `sonar-reasoning`

**Best for**: Step-by-step reasoning questions

**Context**: 128k tokens
**Web Search**: ✓ Yes

**Use `sonar-reasoning` when**:
- Question requires logical deduction
- Need step-by-step problem solving
- Math or algorithmic reasoning involved
- Want to see the reasoning process

### `sonar-reasoning-pro`

**Best for**: Advanced reasoning with comprehensive analysis

**Context**: 128k tokens
**Web Search**: ✓ Yes

**Use `sonar-reasoning-pro` when**:
- Advanced reasoning with more comprehensive analysis needed
- Complex multi-step logical problems
- Need most thorough step-by-step explanations
- Reasoning task benefits from deeper exploration
- The standard reasoning model doesn't provide enough detail

### `r1-1776`

**Best for**: Specialized reasoning without web search

**Context**: 128k tokens
**Web Search**: ✗ No

**Use `r1-1776` when**:
- Need specialized reasoning without web search
- Pure analytical or logical tasks
- Information is already known, just need reasoning applied
- Want to avoid web search overhead

**Note**: This is the only model that omits real-time web search.

## Common Decision Patterns

### Pattern: Start Simple, Upgrade If Needed

1. Start with `sonar` for most queries
2. If response lacks depth → retry with `sonar-pro`
3. If response lacks reasoning → retry with `sonar-reasoning`

### Pattern: Match Model to Question Type

| Question Type | Recommended Model |
|--------------|-------------------|
| "What is...?" | `sonar` |
| "What are the trade-offs...?" | `sonar-pro` |
| "How should I design...?" | `sonar-reasoning-pro` |
| "Compare X, Y, and Z..." | `sonar-deep-research` |
| "Calculate..." or "Prove..." | `sonar-reasoning` |

### Pattern: Consider Context Window Needs

- Most queries fit in 128k → Use standard models
- Very long documents or large context → Use `sonar-pro` (200k)

## Examples by Model

### `sonar` Example
```bash
llm -m sonar 'What is the latest version of React?'
```

### `sonar-pro` Example
```bash
llm -m sonar-pro 'Compare microservices vs monolith architecture for a team of 5 engineers, considering maintainability, scalability, and developer experience'
```

### `sonar-deep-research` Example
```bash
llm -m sonar-deep-research 'What are the best practices for implementing real-time features in web applications in 2026?'
```

### `sonar-reasoning` Example
```bash
llm -m sonar-reasoning 'How should I optimize a database query that joins 5 tables and filters on multiple indexed columns?'
```

### `sonar-reasoning-pro` Example
```bash
llm -m sonar-reasoning-pro 'Design a distributed caching strategy for a multi-region application with strict consistency requirements'
```

### `r1-1776` Example
```bash
llm -m r1-1776 'Given these constraints [X, Y, Z], what is the optimal algorithm complexity I can achieve?'
```
