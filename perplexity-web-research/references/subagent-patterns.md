# Subagent Invocation Patterns

This document provides detailed patterns for using Perplexity Web Research as a subagent for complex, multi-step research tasks.

## When to Use Subagents vs Direct Invocation

**Direct invocation**: Use the Bash tool to run `llm` commands inline when the query is straightforward and the result can be immediately incorporated.

**Subagent invocation**: Spawn a subagent when:
- Research requires multiple iterations or follow-up queries
- You want the subagent to synthesize findings before reporting back
- The reasoning task is complex enough to benefit from dedicated focus
- You want to continue other work while research happens in parallel

## Pattern 1: Research and Report Back

Use when you need comprehensive research that should be synthesized before continuing.

**Scenario**: Spawn a subagent to research OAuth 2.0 vs JWT authentication for mobile apps.

**Task description for subagent**:
> Research OAuth 2.0 vs JWT authentication for mobile apps using Perplexity.
>
> Focus on:
> - Security trade-offs between the two approaches
> - Implementation complexity for mobile clients
> - Token refresh strategies and best practices
> - 2026 industry recommendations
>
> Use the `sonar-pro` model for comprehensive coverage.
>
> Return a structured comparison with:
> 1. Summary of each approach (2-3 sentences)
> 2. Key trade-offs table
> 3. Your recommendation with rationale

**When to use this pattern:**
- Topic requires research across multiple dimensions
- You need synthesis, not just raw search results
- The findings will inform your next decision or implementation
- Research can happen while you work on other tasks

## Pattern 2: Multi-Step Research with Iteration

Use when initial research will reveal what follow-up questions to ask.

**Scenario**: Spawn a subagent to investigate WebSocket connection issues.

**Task description for subagent**:
> Investigate why WebSocket connections are dropping after 60 seconds in a Next.js application deployed on Vercel using Perplexity.
>
> Step 1: Research common causes (use `sonar`)
> Step 2: Based on findings, research Vercel-specific WebSocket limitations (use `sonar-pro`)
> Step 3: If timeouts are involved, research timeout configuration options
>
> Return:
> - Most likely root cause based on evidence
> - Specific configuration changes needed
> - Alternative approaches if WebSocket limitations are fundamental

**When to use this pattern:**
- Problem diagnosis requires following evidence trails
- Each finding reveals new questions to ask
- You don't know all the right questions upfront
- Research depth is more important than speed

## Pattern 3: Parallel Research Tasks

Use when you need to research multiple independent topics.

**Scenario**: Spawn a subagent to compare deployment platforms.

**Task description for subagent**:
> Research three deployment platforms for a Next.js app: Vercel, Netlify, and AWS Amplify using Perplexity.
>
> For each platform, research (use `sonar-pro` for each):
> 1. Pricing for ~10k monthly visitors
> 2. Build time performance
> 3. Edge function capabilities
> 4. Developer experience ratings
>
> Return a comparison table with a recommendation based on: best value for small team, fastest builds, and modern features.

**When to use this pattern:**
- Multiple independent research topics
- You want all findings synthesized into a single report
- Parallel research is more efficient than sequential queries

## Direct Invocation Example (For Comparison)

For simple, single-query research, invoke directly instead:

```bash
llm -m sonar 'What changed in Next.js 15 App Router compared to version 14?'
```

**Use direct invocation when:**
- Question is straightforward with a clear answer
- No follow-up research anticipated
- Results can be immediately incorporated into your response
- Speed matters more than depth
