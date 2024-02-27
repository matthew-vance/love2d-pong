std = "max+love"
max_line_length = 120

globals = {
	"Class",
}

files["src/conf.lua"].max_line_length = false

exclude_files = {
  "lib",
	"build",
  ".DS_Store",
}
