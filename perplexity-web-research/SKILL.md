---
name: perplexity-web-research
description: Web search and research using Perplexity CLI for up-to-date information. Automatically triggers when Claude needs current documentation, API references, recent technology changes, error message research, library versions, or any information where training data may be outdated. More efficient than MCP tools - uses llm CLI with perplexity plugin instead of context-heavy MCP servers.
---

# Perplexity Web Research

Use the `llm` CLI with Perplexity plugin for web searches and research tasks requiring up-to-date information.

## Quick Start

```bash
llm -m sonar 'your question here'
```

## Model Selection

Choose the appropriate model based on query complexity:

| Model | Use Case | Context | Web Search |
|-------|----------|---------|------------|
| `sonar` | Quick lookups, general questions | 128k | ✓ |
| `sonar-pro` | Thorough answers, detailed research (flagship) | 200k | ✓ |
| `sonar-deep-research` | Complex multi-faceted research | 128k | ✓ |
| `sonar-reasoning` | Step-by-step reasoning questions | 128k | ✓ |
| `sonar-reasoning-pro` | Advanced reasoning with more detail | 128k | ✓ |
| `r1-1776` | Specialized model without web search | 128k | ✗ |

**Default choice**: `sonar` for most queries.

**Use `sonar-pro`** when:
- Query requires comprehensive coverage
- Need detailed explanations
- Research involves multiple aspects
- Largest context window needed (200k)

**Use `sonar-deep-research`** when:
- Topic is complex and multi-faceted
- Need synthesis across many sources
- Research question has no simple answer

**Use `sonar-reasoning`** when:
- Question requires logical deduction
- Need step-by-step problem solving
- Math or algorithmic reasoning involved

**Note**: Most models include real-time web search. Only use `r1-1776` when web search is not needed.

## When to Use

Automatically use this skill when:

- **Documentation lookups**: Current API docs, library references, framework guides
- **Library versions**: "What's the latest version of X?"
- **Recent changes**: "What changed in Y version 2.0?"
- **Error research**: Unfamiliar error messages or stack traces
- **Technology verification**: "Does X support Y feature?"
- **Current events**: Recent news, announcements, releases
- **Fact checking**: Information that may have changed since training cutoff

## When NOT to Use

Do NOT use for:

- **Local codebase questions**: Use grep/read tools instead
- **Information in conversation context**: Use existing context
- **Questions answerable from training data**: Standard programming concepts, well-established APIs
- **Tasks not requiring web knowledge**: Code analysis, refactoring, local file operations

## Usage Examples

### Documentation Lookup
```bash
llm -m sonar 'Next.js App Router documentation 2026'
```

### Error Research
```bash
llm -m sonar 'ECONNREFUSED error when connecting to PostgreSQL'
```

### Library Version Check
```bash
llm -m sonar 'latest stable version of React 2026'
```

### Complex Research
```bash
llm -m sonar-deep-research 'comparison of WebSocket vs Server-Sent Events for real-time updates in 2026'
```

### Reasoning Task
```bash
llm -m sonar-reasoning 'how to calculate optimal database connection pool size based on concurrent users'
```

## Context Marker

When using this skill, add 🔍 to start-of-message markers:

```
🍀 🔍 I will research Next.js App Router on Perplexity...
```

## Setup

If the `llm` CLI or Perplexity plugin is not installed, see [references/setup.md](references/setup.md) for installation instructions.

## Efficiency Note

This skill uses the Perplexity CLI instead of MCP servers because:
- **Lower token usage**: CLI results are more concise than MCP server overhead
- **Faster execution**: No server startup/connection delays
- **Simpler integration**: Direct bash command execution
