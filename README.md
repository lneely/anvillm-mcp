# anvillm-mcp

MCP (Model Context Protocol) server providing sandboxed code execution for LLM agents.

## Overview

anvilmcp bridges MCP clients (Claude Desktop, Kiro, etc.) to shell execution with security isolation. It wraps script execution in a sandbox (landlock/landrun/bwrap) to limit filesystem and network access.

**Note:** The tools themselves are hosted by anvillm via 9P at `anvillm/tools/*`. anvilmcp is optional — without it, you can still run tools directly:

```sh
bash <(9p read anvillm/tools/check_inbox.sh)
```

anvilmcp adds sandboxed execution for MCP clients, but is not required for basic tool usage.

## Installation

```sh
mk install
```

### Backend Setup

Install MCP configuration for your backend:

```sh
./claude/install-mcp.sh      # Claude Desktop
./kiro-cli/install-mcp.sh    # Kiro CLI
./ollama/install-mcp.sh      # Ollama
```

## Configuration

Sandbox configuration uses layered YAML files from `~/.config/anvillm/`:
- `global.yaml` — base configuration
- `sandbox/<name>.yaml` — sandbox-specific overrides

See `docs/` for detailed security and usage documentation.

## Dependencies

- anvillm (required) — serves tools via 9P, manages sessions/beads
- landrun or bwrap (optional) — sandbox isolation
