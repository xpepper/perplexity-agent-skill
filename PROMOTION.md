# Promotion Plan for Perplexity Web Research Skill

## Quick Links
- **GitHub**: https://github.com/xpepper/perplexity-agent-skill
- **Install**: `npx skills add xpepper/perplexity-agent-skill`

## 1. GitHub Preparation

### ✅ Checklist
- [x] Push all commits to GitHub ✓
- [x] Add topics/tags to repository ✓
  - `agent-skills`
  - `ai-agents`
  - `claude-code`
  - `github-copilot`
  - `perplexity`
  - `ai-tools`
  - `llm`
- [ ] Create a release/tag (v1.0.0)
- [ ] Add social preview image (optional but recommended)

### Create Release (Next Step)

**Option 1: Command Line**
```bash
# Create and push tag
git tag -a v1.0.0 -m "Initial release: Perplexity Web Research Agent Skill

- Web research with current knowledge
- Independent second opinions for decisions
- Deep reasoning delegation to specialized models
- Works with 30+ AI agents (Claude Code, Copilot, Cursor, etc.)
- MIT licensed
"
git push origin v1.0.0
```

**Option 2: GitHub UI (Recommended for first release)**
1. Go to https://github.com/xpepper/perplexity-agent-skill/releases/new
2. Click "Choose a tag" → type `v1.0.0` → "Create new tag"
3. Release title: `v1.0.0 - Initial Release`
4. Description:
```markdown
# Perplexity Web Research Agent Skill

First public release! 🎉

## Features
- ✅ Web research with up-to-date information
- ✅ Independent second opinions for architecture decisions
- ✅ Deep reasoning delegation to specialized models
- ✅ Works with 30+ AI agents (Claude Code, GitHub Copilot, Cursor, Windsurf, etc.)
- ✅ Efficient CLI-based approach (no MCP overhead)
- ✅ MIT licensed

## Installation
```bash
npx skills add xpepper/perplexity-agent-skill
```

## What's Included
- Comprehensive skill with 6 Perplexity models
- Progressive disclosure design (minimal context usage)
- Setup guide and troubleshooting
- Validated against agentskills.io specification

## Documentation
See README.md for full documentation and usage examples.
```
5. Attach `perplexity-web-research.skill` file as release asset
6. Check "Set as the latest release"
7. Click "Publish release"

### Add Social Preview Image

**Quick Option: Use GitHub's Auto-Generated**
GitHub will auto-generate one from your README, which often works well.

**Custom Option: Create Your Own**
1. Dimensions: 1280x640px (GitHub's recommended size)
2. Content suggestions:
   - Skill name: "Perplexity Web Research"
   - Tagline: "Agent Skills for 30+ AI Coding Assistants"
   - Key features icons/text
   - GitHub username
3. Upload:
   - Go to repo Settings → General → Social preview
   - Upload image
   - Save changes

**Need help creating an image?** Tools:
- Canva (easiest, has templates)
- Figma (more control)
- Or skip for now - auto-generated works fine

## 2. Discovery Platforms

### skills.sh
- **URL**: https://skills.sh
- **Action**: Submit skill for discovery
- **Benefits**: Official Agent Skills directory, high visibility

### n-skills Marketplace
- **GitHub**: https://github.com/numman-ali/n-skills
- **Action**: Create PR or issue requesting inclusion
- **Benefits**: Curated marketplace for quality skills

## 3. Social Media Announcements

### Twitter/X Post
```
🚀 Just released: Perplexity Web Research Agent Skill

Bring Perplexity's reasoning models to your AI coding assistant:
✅ Current knowledge lookups
✅ Independent second opinions
✅ Deep reasoning delegation

Works with Claude Code, Copilot, Cursor & 30+ agents

Install: npx skills add xpepper/perplexity-agent-skill

#AI #AgentSkills #Perplexity #ClaudeCode #GitHubCopilot
```

### LinkedIn Post
```
Excited to share my latest open-source project: Perplexity Web Research Agent Skill!

This Agent Skills package brings Perplexity's specialized reasoning models to any AI coding assistant that supports the agentskills.io standard.

🎯 Key capabilities:
• Web research with up-to-date information
• Independent validation for architecture decisions
• Deep reasoning delegation for complex problems

💡 Why it matters:
Instead of relying on MCP servers (which consume tokens), this skill uses the efficient Perplexity CLI to:
- Preserve context window space
- Execute faster
- Work anywhere bash is available

🛠️ One-line install:
npx skills add xpepper/perplexity-agent-skill

Compatible with Claude Code, GitHub Copilot, Cursor, Windsurf, and 30+ other AI agents.

Check it out: https://github.com/xpepper/perplexity-agent-skill

#OpenSource #AI #DeveloperTools #AgentSkills #Perplexity
```

### Dev.to Article Draft

**Title**: "Building an Agent Skills Package: Perplexity Web Research for AI Coding Assistants"

**Tags**: ai, opensource, tools, productivity

**Content outline**:
1. Introduction - The problem (AI agents need current knowledge)
2. What are Agent Skills (agentskills.io)
3. Why Perplexity CLI over MCP
4. The three use cases (current knowledge, second opinions, reasoning)
5. How to install and use
6. Technical implementation details
7. Future improvements
8. Call to action

## 4. Community Engagement

### Reddit Posts

**r/ClaudeAI**
Title: "Released: Perplexity Web Research skill for Claude Code and all Agent Skills-compatible tools"

**r/github**
Title: "Built an Agent Skill for GitHub Copilot that brings Perplexity research capabilities"

**r/programming**
Title: "Open-sourced Perplexity Agent Skill - adds web research & reasoning to AI coding assistants"

**r/opensource**
Title: "New MIT-licensed Agent Skill: Perplexity Web Research for 30+ AI agents"

### Hacker News
Title: "Show HN: Perplexity Web Research Agent Skill for Claude Code, Copilot, and 30+ AI agents"

## 5. Direct Outreach

### Vercel Team
- Tweet at @vercel mentioning their Skills CLI
- Tag in LinkedIn post
- GitHub issue/discussion in vercel-labs/skills repo

### Anthropic/Claude
- Tweet at @AnthropicAI
- Share in Claude Discord community (if exists)

### Perplexity
- Tweet at @perplexity_ai showing the integration
- Potential collaboration opportunity

## 6. Content Creation

### Blog Post Ideas
1. "How I Built a Cross-Platform Agent Skill in One Weekend"
2. "Why CLI Tools Beat MCP Servers for AI Agents"
3. "The Agent Skills Standard: npm for AI Agents"

### Video Ideas (YouTube/TikTok)
1. Quick demo: Installing and using the skill
2. Comparison: With vs without the skill
3. Deep dive: How Agent Skills work

## 7. Metrics to Track

- GitHub stars
- npm downloads (via skills CLI metrics if available)
- Social media engagement
- Issues/PRs from community
- Forks and contributions

## Timeline

### Week 1
- [ ] Push to GitHub and create release
- [ ] Submit to skills.sh and n-skills
- [ ] Post on Twitter/X and LinkedIn
- [ ] Post on Reddit (spread across different days)

### Week 2
- [ ] Write Dev.to article
- [ ] Post on Hacker News
- [ ] Engage with comments and feedback

### Week 3
- [ ] Create demo video
- [ ] Follow up with communities
- [ ] Plan v1.1 based on feedback

## Pre-Launch Checklist

- [ ] All commits pushed to GitHub
- [ ] README is clear and comprehensive
- [ ] License is correct (MIT)
- [ ] Repository topics/tags added
- [ ] Release created
- [ ] Social media accounts ready
- [ ] Announcement posts drafted
- [ ] Community guidelines prepared for contributors
