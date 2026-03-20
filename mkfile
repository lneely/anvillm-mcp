INSTALL_PATH=$HOME/bin

all:V: install

build:V:
	go build -o $INSTALL_PATH/anvilmcp .
	mkdir -p $HOME/.config/anvillm/mcptools
	cp -rf mcptools/* $HOME/.config/anvillm/mcptools/
	chmod 0755 $HOME/.config/anvillm/mcptools/*
	bash kiro-cli/install-mcp.sh
	bash -c 'CLAUDE_CONFIG_DIR=$HOME/.config/anvillm/claude claude/install-mcp.sh'
	cp ollama/mcp.json $HOME/.config/anvillm/ollama-mcp.json

install:V: build

clean:V:
	rm -f $INSTALL_PATH/anvilmcp
