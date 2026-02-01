# Perplexity Web Research Skill - Implementation Plan

## Overview

Create a skill that guides Claude to use the Perplexity CLI (`llm` with `llm-perplexity` plugin) for web research, replacing the less efficient MCP server approach.

## Goals

1. Enable Claude to retrieve up-to-date information from the web
2. Avoid token-heavy MCP server usage
3. Automatic triggering when research needs are detected
4. Efficient model selection based on query complexity

## Skill Structure

### Directory Layout

```
perplexity-web-research/
├── SKILL.md
└── references/
    └── setup.md
```

### Files

#### SKILL.md

**Frontmatter (YAML)**:
```yaml
---
name: perplexity-web-research
description: Web search and research using Perplexity CLI for up-to-date information. Automatically triggers when Claude needs current documentation, API references, recent technology changes, error message research, library versions, or any information where training data may be outdated. More efficient than MCP tools - uses llm CLI with perplexity plugin instead of context-heavy MCP servers.
---
```

**Body structure**:

1. **Quick Start** - Basic usage pattern with most common command
2. **Model Selection Guide** - Decision tree for choosing sonar/sonar-pro/sonar-deep-research/sonar-reasoning
3. **When to Use** - Automatic trigger scenarios:
   - Current documentation/API lookups
   - Library versions and recent changes
   - Error message research
   - Technology verification
   - Current events
   - Facts that may be outdated
4. **When NOT to Use** - Anti-patterns:
   - Local codebase questions
   - Information answerable from existing context
5. **Usage Examples** - Concrete examples for each model type
6. **Setup Reference** - Link to references/setup.md
7. **Context Marker** - Document the 🔍 emoji pattern

**Key principles**:
- Concise (target: < 200 lines)
- Focus on decision-making (WHEN to use, WHICH model)
- Examples over explanations
- Progressive disclosure (setup details in references/)

#### references/setup.md

**Content**:
- Installation steps (pip install llm, llm install llm-perplexity)
- API key configuration
- Verification commands
- Troubleshooting common issues
- Documentation references:
  - llm CLI: https://llm.datasette.io/
  - llm-perplexity plugin: https://github.com/hex/llm-perplexity

**Purpose**: Only loaded when user encounters setup issues or asks about installation

## Trigger Strategy

**Automatic detection** - Skill description includes comprehensive trigger scenarios so Claude proactively invokes it when:
- Documentation lookup needed
- Current events mentioned
- API/library version questions
- Error messages to research
- Technology verification needed
- User's question suggests outdated knowledge

## Design Decisions

### Why no scripts?

The `llm -m sonar 'query'` command is simple enough that Claude doesn't need a pre-written script. Adding a script would increase maintenance burden without improving reliability.

### Why CLI over MCP?

- **Token efficiency**: CLI tool results consume fewer tokens than MCP server overhead
- **Simplicity**: Bash execution is straightforward
- **Performance**: No MCP server startup/connection overhead

### Why references/setup.md?

Following progressive disclosure principle - setup instructions are only needed once during initial configuration, not every time the skill is used. Keeping them separate reduces context bloat.

## Implementation Steps

Following skill-creator workflow:

1. ✅ **Understand the skill** - Completed via specs/perplexity.md review
2. ✅ **Plan reusable contents** - Only references/setup.md needed
3. **Initialize skill** - Run `scripts/init_skill.py perplexity-web-research`
4. **Edit skill**:
   - Write references/setup.md (move content from specs/perplexity.md)
   - Write SKILL.md frontmatter and body
   - Delete unused example directories (scripts/, assets/ not needed)
5. **Package skill** - Run `scripts/package_skill.py` to validate and create .skill file
6. **Iterate** - Test on real queries and refine based on usage

## Expected Outcomes

After implementation:
- Claude automatically uses Perplexity for research without explicit prompting
- Efficient model selection based on query complexity
- Reduced context window usage compared to MCP approach
- Clear guidance on when web research is (and isn't) needed
- Easy setup for new users via references/setup.md

## Validation Criteria

Skill is successful if:
- ✅ Automatically triggers for documentation lookups
- ✅ Automatically triggers for current events
- ✅ Does NOT trigger for local codebase questions
- ✅ Selects appropriate model (sonar vs sonar-pro, etc.)
- ✅ Includes context marker 🔍 in responses
- ✅ Passes package_skill.py validation
