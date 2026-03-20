INSTALL_PATH=$HOME/bin

all:V: install

build:V:
	go build -o $INSTALL_PATH/anvilmcp .
	mkdir -p $HOME/.config/anvillm/mcptools
	cp -rf mcptools/* $HOME/.config/anvillm/mcptools/
	chmod 0755 $HOME/.config/anvillm/mcptools/*

install:V: build

clean:V:
	rm -f $INSTALL_PATH/anvilmcp
