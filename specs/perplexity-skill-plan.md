# Perplexity Web Research Skill - Implementation Plan

## Overview

Create a skill that guides Claude to use the Perplexity CLI (`llm` with `llm-perplexity` plugin) for web research, deep reasoning, and independent validation. This skill complements (not replaces) standard web tools and can be invoked directly or spawned as a subagent.

## Goals

1. Enable Claude to retrieve up-to-date information from the web
2. Provide independent second opinions for decision validation
3. Delegate complex analytical thinking to specialized reasoning models
4. Avoid token-heavy MCP server usage
5. Automatic triggering when research, validation, or reasoning needs are detected
6. Efficient model selection based on query complexity and purpose

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
description: Leverage Perplexity CLI for web research, deep reasoning, and independent validation. Use when you need current/external knowledge, want a second opinion before decisions, or want to delegate complex analytical thinking to specialized reasoning models. Complements (not replaces) standard web tools. Can be invoked directly or spawned as a subagent. More efficient than MCP servers - uses llm CLI with perplexity plugin.
---
```

**Body structure**:

1. **Quick Start** - Basic usage pattern with most common command
2. **Model Selection Guide** - Decision tree for choosing sonar/sonar-pro/sonar-deep-research/sonar-reasoning
3. **When to Use** - Three primary scenarios:
   - Current/external knowledge (documentation, versions, errors, current events)
   - Second opinions (architecture decisions, technology choices, validation)
   - Deep reasoning delegation (complex problem solving, algorithmic thinking, trade-off analysis)
4. **When NOT to Use** - Anti-patterns and clarification that this complements other web tools
5. **Usage Examples** - Concrete examples for each scenario and model type
6. **Using as a Subagent** - Guidance on when to invoke directly vs spawn subagent
7. **Setup Reference** - Link to references/setup.md
8. **Context Marker** - Document the 🔍 emoji pattern
9. **Relationship with Other Tools** - Clarify complementary nature with standard web tools

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

### Current/External Knowledge
- Documentation lookup needed
- Current events mentioned
- API/library version questions
- Error messages to research
- Technology verification needed
- User's question suggests outdated knowledge

### Second Opinions
- Architecture or design decisions being made
- Technology choice comparisons needed
- Validation of approach before implementation
- Alternative perspectives requested

### Deep Reasoning
- Complex multi-step problem solving
- Algorithmic optimization questions
- System architecture design
- Trade-off analysis with many variables
- Mathematical or quantitative reasoning needed

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
- Claude automatically uses Perplexity for research, validation, and reasoning without explicit prompting
- Efficient model selection based on query complexity and purpose
- Reduced context window usage compared to MCP approach
- Clear guidance on when to use Perplexity vs standard web tools
- Understanding of when to invoke directly vs spawn subagent
- Independent validation capability for architecture decisions
- Delegation of complex reasoning to specialized models
- Easy setup for new users via references/setup.md

## Validation Criteria

Skill is successful if:
- ✅ Automatically triggers for documentation lookups
- ✅ Automatically triggers for current events
- ✅ Automatically triggers for second opinion scenarios
- ✅ Automatically triggers for deep reasoning tasks
- ✅ Does NOT trigger for local codebase questions
- ✅ Selects appropriate model (sonar vs sonar-pro vs sonar-reasoning, etc.)
- ✅ Understands when to use as subagent vs direct invocation
- ✅ Complements (not replaces) other web tools
- ✅ Includes context marker 🔍 in responses
- ✅ Passes package_skill.py validation
