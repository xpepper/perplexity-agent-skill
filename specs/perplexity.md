# Web Research and Deep Reasoning via Perplexity CLI

Leverage the `llm` CLI with Perplexity plugin for web research, deep reasoning, and independent validation. Use when you need current/external knowledge, want a second opinion before decisions, or want to delegate complex analytical thinking to specialized reasoning models. This complements (not replaces) standard web tools.

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

Use in three primary scenarios:

### 1. Current or External Knowledge
- Looking up current documentation, APIs, or library versions
- Researching error messages or unfamiliar technologies
- Verifying facts or checking for recent changes
- Any question where your training data may be outdated

### 2. Second Opinions
- Getting independent validation before architecture decisions
- Comparing technology choices or approaches
- Verifying that your thinking about a problem is sound
- Seeking alternative perspectives on design choices

### 3. Deep Reasoning Delegation
- Offloading complex multi-step reasoning to specialized models
- Algorithmic problem solving and optimization
- System architecture design
- Trade-off analysis with many variables
- Mathematical or quantitative reasoning

**Note**: Can be invoked directly via Bash or spawned as a subagent for focused research.

## Do NOT Use For

- Questions answerable from the local codebase (use grep/read instead)
- Information already in conversation context
- Simple factual questions answerable from training data
