# Perplexity Web Research: An Agent Skill for AI Coding Assistants

*One-line install. Works with 30+ AI agents. Zero MCP overhead.*

---

## The Problem

AI coding assistants are stuck in the past. Ask Claude Code or GitHub Copilot about the latest React version, and you get: *"Based on my training data from 2024..."*

The common solution? Model Context Protocol (MCP) servers. But MCP is **token-heavy**, **slow to start**, and **eats your context window**.

## The Solution

I built an [Agent Skills](https://agentskills.io) package that uses Perplexity's CLI instead:

**Perplexity Web Research** - Three superpowers for AI agents:

1. **Current Knowledge** - Documentation, library versions, error research
2. **Second Opinions** - Architecture decisions, technology choices
3. **Deep Reasoning** - Complex problem solving with specialized models

## Why CLI Beats MCP

| MCP Server | Perplexity CLI |
|------------|----------------|
| High token overhead | Minimal tokens |
| Slow startup | Instant |
| Complex setup | Simple bash |

**Result**: AI agents get current knowledge and powerful reasoning **without sacrificing context window**.

## How It Works

The skill automatically selects the right Perplexity model:
- `sonar` - Quick lookups
- `sonar-pro` - Deep research (200k context)
- `sonar-reasoning-pro` - Complex analytical thinking

Example: Ask about real-time architectures, get current 2026 info on WebSockets vs SSE, synthesized from multiple sources.

## One-Line Install

```bash
npx skills add xpepper/perplexity-agent-skill
```

Works with Claude Code, GitHub Copilot, Cursor, Windsurf, and 30+ agents.

## Why This Matters

Agent Skills are **npm for AI agents**:
- ✅ Write once, works everywhere
- ✅ Open standard (agentskills.io)
- ✅ MIT licensed
- ✅ Progressive disclosure (minimal context cost)

This skill proves CLI tools can beat MCP servers while preserving precious context tokens.

## Try It

**Install**:
```bash
npx skills add xpepper/perplexity-agent-skill
```

**Setup** (one-time):
```bash
pip install llm
llm install llm-perplexity
llm keys set perplexity
```

**GitHub**: https://github.com/xpepper/perplexity-agent-skill

---

*Built with ❤️ by Pietro Di Bello | MIT License*

**Perfect for**: Twitter threads, LinkedIn posts, short articles
