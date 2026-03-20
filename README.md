# anvillm-mcp

MCP (Model Context Protocol) server for tool execution with sandboxing.

## Usage

```sh
# Build and install
mk

# The server is invoked by MCP clients (Claude, Kiro, etc.)
anvilmcp
```

## Features

- Sandboxed code execution via bwrap/firejail
- Tool scripts in `mcptools/`
- Pipeline support for chaining tools
- Rate limiting and security validation
- Execution metrics logging

## Configuration

Sandbox configuration uses layered YAML files from `~/.config/anvillm/`:
- `global.yaml` - base configuration
- `sandbox/<name>.yaml` - sandbox-specific overrides

See `docs/` for detailed security and usage documentation.

## mcptools

Shell scripts that provide MCP tools for:
- Beads task management (create, claim, complete, etc.)
- Session control
- Messaging between agents
- Skill discovery and loading
- Code exploration

Installed to `~/.config/anvillm/mcptools/` by `mk install`.
