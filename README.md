# Homebrew Tap for Agent Tracking

Official Homebrew tap for [Agent Tracking](https://agenttracking.co) (`shufflethis/agent-tracking`).

## Install

```sh
brew install shufflethis/tap/agenttracking
```

## Quick start (100% offline, no account required)

```sh
# 1. Offline MCP security, permission, cron & guardrail audit
agenttracking audit

# 2. Local loop & destructive shell circuit breaker (<2 ms on-device)
agenttracking guard --max-failures 5 --max-calls 80 --max-minutes 45 --block-destructive on

# 3. Connect hooks for Claude Code, Cursor, Codex CLI, Gemini CLI & Antigravity
agenttracking connect all
```
