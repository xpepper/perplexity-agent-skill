# Web Search via Perplexity CLI

When you need to search the web, look up documentation, research a topic, or answer a question that requires up-to-date information, use the `llm` CLI with the Perplexity plugin instead of MCP tools.

**Context Marker**: When working with this file, add `🔍` to your start-of-message markers.

**Example**:
"🍀 🔍 I will research the this topic on Perplexity..."

## Prerequisites

- Install the `llm` CLI: `pip install llm` (or `brew install llm`)
- Install the Perplexity plugin: `llm install llm-perplexity`
- Configure API key: `llm keys set perplexity` (paste your Perplexity API key when prompted)
- Verify setup: `llm -m sonar 'hello'` should return a response

## Usage

```bash
# General web search / questions
llm -m sonar 'your question here'

# More thorough answers (flagship model, 200k context)
llm -m sonar-pro 'your question here'

# Deep research on complex topics
llm -m sonar-deep-research 'your complex research question'

# Reasoning-heavy questions
llm -m sonar-reasoning 'your reasoning question'
```

## Model Selection Guide

- `sonar` — Default choice for quick lookups and general questions
- `sonar-pro` — Use when you need more thorough or detailed answers
- `sonar-deep-research` — Use for complex multi-faceted research
- `sonar-reasoning` / `sonar-reasoning-pro` — Use when the question requires step-by-step reasoning

## When to Use

- Looking up current documentation, APIs, or library versions
- Researching error messages or unfamiliar technologies
- Verifying facts or checking for recent changes
- Any question where your training data may be outdated

## Do NOT Use For

- Questions answerable from the local codebase (use grep/read instead)
- Tasks that don't require web knowledge
