# anvillm-mcp

MCP server providing sandboxed code execution for LLM agents.

## Overview

anvillm-mcp bridges MCP clients (Claude Desktop, Kiro, etc.) to shell execution with security isolation. It wraps script execution in a sandbox (landlock/landrun/bwrap) to limit filesystem and network access.

The `execute_code` tool implementation lives in [ollie](https://github.com/lneely/ollie)'s `exec` package. anvillm-mcp imports it directly, so the two share the same sandboxed execution engine. ollie uses the same package as a built-in tool and does not need anvillm-mcp for `execute_code` — this server exists for MCP clients that lack a built-in equivalent.

**Note:** The tools themselves are hosted by anvillm via 9P at `anvillm/tools/*`. anvillm-mcp is optional — without it, you can still run tools directly:

```sh
bash <(9p read anvillm/tools/check_inbox.sh)
```

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

Sandbox configuration uses layered YAML files from `~/.config/anvillm/`, provided by [anvillm](https://github.com/lneely/anvillm):
- `global.yaml` — base configuration
- `sandbox/<name>.yaml` — sandbox-specific overrides

See `docs/` for detailed security and usage documentation.

## Dependencies

- [ollie](https://github.com/lneely/ollie) (required) — provides the `exec` package
- anvillm (required) — serves tools via 9P, manages sessions/beads
- landrun or bwrap (optional) — sandbox isolation
