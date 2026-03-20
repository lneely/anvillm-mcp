module github.com/lneely/anvillm-mcp

go 1.25.6

require (
	9fans.net/go v0.0.7
	anvillm v0.0.0-00010101000000-000000000000
)

require gopkg.in/yaml.v3 v3.0.1 // indirect

replace anvillm => ../anvillm/main
