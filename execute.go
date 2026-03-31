package main

import (
	"os"
	"path/filepath"

	execpkg "ollie/exec"
)

var executor = func() *execpkg.Executor {
	home, _ := os.UserHomeDir()
	return execpkg.New(
		filepath.Join(home, ".local", "state", "anvilmcp"),
		filepath.Join(home, ".cache", "anvillm", "exec"),
	)
}()
