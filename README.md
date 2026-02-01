# Perplexity Web Research Skill

An [Agent Skills](https://agentskills.io) package that leverages the Perplexity CLI for web research, deep reasoning, and independent validation. Compatible with any AI coding assistant that supports the Agent Skills standard (Claude Code, GitHub Copilot, Cursor, Windsurf, and 30+ other agents).

## What This Skill Does

This skill enables AI assistants to use Perplexity's specialized models for three primary purposes:

### 1. Current or External Knowledge
- Documentation lookups and API references
- Library versions and recent technology changes
- Error message research
- Current events and fact checking

### 2. Independent Second Opinions
- Architecture and design decision validation
- Technology choice comparisons
- Alternative perspectives on problem-solving approaches
- Pre-implementation validation

### 3. Deep Reasoning Delegation
- Complex multi-step problem solving
- Algorithmic optimization and system design
- Trade-off analysis with many variables
- Mathematical and quantitative reasoning

## Why CLI over MCP?

This skill uses the Perplexity CLI (`llm` with `llm-perplexity` plugin) instead of MCP servers because:

- **Lower token usage**: CLI results are more concise than MCP server overhead, preserving valuable context window space
- **Faster execution**: No server startup/connection delays - just direct bash command execution
- **Simpler integration**: Straightforward CLI tool that works anywhere bash is available
- **Complementary approach**: Works alongside standard web tools (WebFetch, WebSearch) rather than replacing them

## Installation

### Quick Install (Recommended)

Use the [Vercel Skills CLI](https://github.com/vercel-labs/skills) to install for any compatible agent:

```bash
# For GitHub Copilot
npx skills add xpepper/perplexity-agent-skill -a github-copilot

# For Claude Code
npx skills add xpepper/perplexity-agent-skill -a claude-code

# For Cursor
npx skills add xpepper/perplexity-agent-skill -a cursor

# Or install for all agents
npx skills add xpepper/perplexity-agent-skill
```

The skill will be automatically installed to the appropriate location for your agent and ready to use immediately.

### Manual Installation

Alternatively, install manually by copying the skill directory:

**For VS Code / GitHub Copilot:**
```bash
git clone https://github.com/xpepper/perplexity-agent-skill.git
cp -r perplexity-agent-skill/perplexity-web-research ~/.copilot/skills/
```

**For Claude Code:**
```bash
git clone https://github.com/xpepper/perplexity-agent-skill.git
cp -r perplexity-agent-skill/perplexity-web-research ~/.claude/skills/
```

**For other agents:** Check your agent's documentation for the skills directory location.

### Prerequisites

The skill requires the `llm` CLI with Perplexity plugin:

```bash
# Install llm CLI
pip install llm
# Or using Homebrew
brew install llm

# Install the Perplexity plugin
llm install llm-perplexity

# Configure your Perplexity API key
llm keys set perplexity
```

Verify the setup:
```bash
llm -m sonar 'hello'
```

For detailed setup instructions and troubleshooting, see [perplexity-web-research/references/setup.md](perplexity-web-research/references/setup.md).

## Usage

The skill automatically triggers when the AI assistant needs:
- Current documentation or up-to-date information
- Independent validation of decisions or approaches
- Complex reasoning or analytical thinking delegation

It can be invoked directly (inline Perplexity queries) or spawned as a subagent for focused research.

### Model Selection

The skill uses different Perplexity models based on the task:

| Model | Use Case | Context |
|-------|----------|---------|
| `sonar` | Quick lookups, general questions | 128k |
| `sonar-pro` | Thorough research (flagship model) | 200k |
| `sonar-deep-research` | Complex multi-faceted research | 128k |
| `sonar-reasoning` | Step-by-step reasoning | 128k |
| `sonar-reasoning-pro` | Advanced reasoning tasks | 128k |

## Documentation

- **Full skill documentation**: [perplexity-web-research/SKILL.md](perplexity-web-research/SKILL.md)
- **Implementation plan**: [specs/perplexity-skill-plan.md](specs/perplexity-skill-plan.md)
- **Setup guide**: [perplexity-web-research/references/setup.md](perplexity-web-research/references/setup.md)
- **llm CLI**: https://llm.datasette.io/
- **llm-perplexity plugin**: https://github.com/hex/llm-perplexity

## Development

### Packaging the Skill

After making changes to the skill, regenerate the `.skill` package:

```bash
./package-skill.sh
```

This script:
- Validates the skill directory structure
- Removes the old package
- Creates a new zip archive with `.skill` extension
- Excludes system files (.DS_Store, __pycache__, etc.)

## License

MIT License - see [LICENSE](LICENSE) file for details.

Copyright (c) 2026 Pietro Di Bello

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.
