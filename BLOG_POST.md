# Building an Agent Skills Package: Bringing Perplexity's Reasoning to AI Coding Assistants

*How I built a cross-platform skill that adds web research and deep reasoning to 30+ AI agents*

---

## The Problem: AI Agents Need Current Knowledge

If you're using AI coding assistants like Claude Code, GitHub Copilot, or Cursor, you've probably run into this scenario:

You ask: *"What's the latest version of React?"*

The AI responds: *"Based on my training data from 2024..."*

You need current information, but the AI is stuck in the past. The common solution? Model Context Protocol (MCP) servers. But there's a problem: **MCP servers are token-heavy, slow to start, and consume precious context window space**.

I wondered: what if we could give AI agents access to current knowledge and powerful reasoning models **without the overhead**?

## Enter Agent Skills

Before diving into the solution, let's talk about [Agent Skills](https://agentskills.io) — a game-changing open standard initiated by Anthropic.

Think of Agent Skills as **npm for AI agents**. Just like you `npm install` a JavaScript package, you can now install reusable instruction sets for AI coding assistants.

An Agent Skill is simply:
- A directory with a `SKILL.md` file
- YAML frontmatter (name, description, metadata)
- Markdown instructions for the AI agent
- Optional resources (scripts, references, assets)

The brilliant part? **Write once, use everywhere**. One skill works across Claude Code, GitHub Copilot, Cursor, Windsurf, and 30+ other AI agents.

## The Solution: Perplexity CLI Instead of MCP

Here's the key insight: Perplexity offers a lightweight CLI tool (`llm` with the `llm-perplexity` plugin) that:

✅ Returns concise results (preserves context window)
✅ Executes instantly (no server startup delays)
✅ Works anywhere bash is available
✅ Provides access to specialized reasoning models

Why is this better than MCP?

| Aspect | MCP Server | Perplexity CLI |
|--------|-----------|----------------|
| Token usage | High (server overhead) | Low (direct results) |
| Startup time | Slow (connection setup) | Instant (bash command) |
| Complexity | Complex (server management) | Simple (CLI tool) |
| Context cost | Expensive | Minimal |

**The result**: An Agent Skill that gives AI assistants superpowers without eating their context window.

## What the Skill Does: Three Powerful Use Cases

I designed the Perplexity Web Research skill around three scenarios:

### 1. Current or External Knowledge

When you need up-to-date information:
- Documentation lookups: *"Show me the Next.js 15 App Router docs"*
- Library versions: *"What's the latest stable version of TypeScript?"*
- Error research: *"What causes ECONNREFUSED when connecting to PostgreSQL?"*
- Current events: *"What changed in React 19?"*

**Example in action**:
```bash
llm -m sonar 'Next.js App Router documentation 2026'
```

### 2. Independent Second Opinions

When you want validation before making decisions:
- Architecture decisions: *"What are the trade-offs between microservices and monolith for a team of 5?"*
- Technology choices: *"Should I use PostgreSQL or MongoDB for this use case?"*
- Design validation: *"Is this approach considered best practice?"*

**Example**:
```bash
llm -m sonar-pro 'trade-offs between microservices and monolith for a team of 5 engineers'
```

### 3. Deep Reasoning Delegation

When you want to offload complex analytical thinking to specialized reasoning models:
- Complex problem solving: Multi-step reasoning requiring systematic analysis
- Algorithmic thinking: *"How should I optimize this caching strategy?"*
- System design: *"Design a scalable job queue system"*
- Trade-off analysis: Comparing multiple options with many variables

**Example**:
```bash
llm -m sonar-reasoning-pro 'design a scalable job queue system that handles both immediate and scheduled tasks with priority levels'
```

## Installation: One Line

Thanks to Vercel's Skills CLI (the "npm for AI Agents"), installation is trivial:

```bash
# For GitHub Copilot
npx skills add xpepper/perplexity-agent-skill -a github-copilot

# For Claude Code
npx skills add xpepper/perplexity-agent-skill -a claude-code

# For any/all agents
npx skills add xpepper/perplexity-agent-skill
```

The skill installs to the appropriate location for your agent and is ready to use immediately.

## Technical Implementation Details

For developers interested in building their own skills, here's how it works:

### Directory Structure
```
perplexity-web-research/
├── SKILL.md              # Main skill file
└── references/
    └── setup.md          # Installation guide
```

### SKILL.md Frontmatter
```yaml
---
name: perplexity-web-research
description: Leverage Perplexity CLI for web research, deep reasoning, and independent validation...
license: MIT
compatibility: Requires llm CLI with llm-perplexity plugin and Perplexity API key
metadata:
  author: Pietro Di Bello
  version: "1.0.0"
allowed-tools: Bash(llm:*)
---
```

### Progressive Disclosure Pattern

Agent Skills follow a three-level loading system:

1. **Metadata** (~100 tokens): Always loaded - `name` and `description` help agents decide when to use the skill
2. **Instructions** (<5k tokens): Loaded when skill activates - full `SKILL.md` content
3. **Resources** (as needed): Referenced files loaded on-demand

This keeps context usage minimal while providing deep functionality.

### Model Selection Logic

The skill includes guidance for choosing between Perplexity models:

- `sonar` (128k context) - Quick lookups, general questions
- `sonar-pro` (200k context) - Thorough research, flagship model
- `sonar-deep-research` (128k) - Complex multi-faceted research
- `sonar-reasoning` (128k) - Step-by-step reasoning
- `sonar-reasoning-pro` (128k) - Advanced reasoning with deeper analysis
- `r1-1776` (128k) - Specialized reasoning without web search

The AI agent automatically selects the appropriate model based on the query complexity.

## Real-World Usage Example

Here's how it works in practice with Claude Code:

**You**: "I'm building a real-time notification system. What are the trade-offs between WebSockets and Server-Sent Events in 2026?"

**Claude** (detecting this needs current research): *🔍 I'll research this on Perplexity...*

```bash
llm -m sonar-deep-research 'comparison of WebSocket vs Server-Sent Events for real-time updates in 2026'
```

**Result**: Claude gets comprehensive, current information about both technologies, including recent developments, and provides an informed recommendation based on your specific use case.

All without consuming massive context window space via MCP servers.

## Validation and Standards Compliance

The skill is fully validated against the [agentskills.io specification](https://agentskills.io/specification):

```bash
pip install skills-ref
python -c "from skills_ref.cli import main; main()" validate perplexity-web-research
# ✓ Valid skill: perplexity-web-research
```

This ensures compatibility across all Agent Skills-compatible tools.

## Why This Matters

This isn't just about one skill — it's about a paradigm shift in how we extend AI agents:

1. **Portable**: Write once, works across 30+ agents
2. **Efficient**: CLI tools beat heavy MCP servers
3. **Open**: MIT licensed, follows open standards
4. **Composable**: Skills can reference and build on each other
5. **Discoverable**: Via skills.sh and the Vercel Skills CLI

The Agent Skills ecosystem is becoming the **npm for AI agents**, and this is just the beginning.

## Lessons Learned

Building this skill taught me several things:

### 1. **Context Window is Precious**
Every token counts. CLI tools that return concise results are far better than chatty MCP servers.

### 2. **Progressive Disclosure is Powerful**
The three-level loading system (metadata → instructions → resources) means skills can be sophisticated without being expensive.

### 3. **Standards Enable Innovation**
The agentskills.io spec makes it trivial to build something that works everywhere. No vendor lock-in, no platform-specific code.

### 4. **Developer Experience Matters**
One-line installation (`npx skills add`) removes all friction. Compare this to manually managing MCP server configs.

### 5. **Specialization Wins**
Perplexity's reasoning models (especially `sonar-reasoning-pro`) are remarkably good at complex analytical tasks. Delegation to specialized models is a powerful pattern.

## What's Next

I'm planning several enhancements:

- **Caching layer**: Avoid redundant API calls for recent queries
- **Cost tracking**: Show token/API usage statistics
- **Multi-model fallback**: Automatically retry with different models if needed
- **Integration examples**: Show common patterns (architecture reviews, tech decisions, etc.)
- **Community templates**: Pre-built query templates for common scenarios

## Try It Yourself

**Installation**:
```bash
npx skills add xpepper/perplexity-agent-skill
```

**Prerequisites** (one-time setup):
```bash
pip install llm
llm install llm-perplexity
llm keys set perplexity
```

**GitHub**: https://github.com/xpepper/perplexity-agent-skill

## Contributing

This is an open-source project under the MIT license. Contributions are welcome!

- Found a bug? Open an issue
- Have an idea? Submit a PR
- Want to discuss? Start a discussion on GitHub

## Conclusion

Agent Skills represent a new way to extend AI coding assistants — portable, efficient, and built on open standards.

By leveraging the Perplexity CLI instead of heavy MCP servers, we can give agents access to current knowledge and powerful reasoning without sacrificing their precious context window.

This is just one skill. Imagine an ecosystem where developers share skills like they share npm packages — a skill for database schema design, a skill for security audits, a skill for accessibility reviews, a skill for performance optimization.

**That's the promise of Agent Skills. And it's available today.**

---

*Built something cool with Agent Skills? I'd love to hear about it. Find me on [GitHub](https://github.com/xpepper) or [Twitter](https://twitter.com/pierodibello).*

---

**Tags**: #AI #AgentSkills #Perplexity #ClaudeCode #GitHubCopilot #OpenSource #DeveloperTools

**Canonical URL**: https://github.com/xpepper/perplexity-agent-skill
