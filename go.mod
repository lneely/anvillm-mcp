module github.com/lneely/anvillm-mcp

go 1.25.6

require ollie v0.0.0-00010101000000-000000000000

require (
	9fans.net/go v0.0.7 // indirect
	anvillm v0.0.0-00010101000000-000000000000 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)

replace ollie => ../ollie

replace anvillm => ../anvillm/main
