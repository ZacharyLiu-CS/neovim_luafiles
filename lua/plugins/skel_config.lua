-- import basic default placeholder callbacks
local status_ok, skel = pcall(require, "skel-nvim")
if not status_ok then
	vim.notify("Fail to load plugin: skel-nvim!", "error")
	return
end
local skeld = require("skel-nvim.defaults")
skel.setup({
	-- dir containing skeleton files (default)
	templates_dir = vim.fn.stdpath("config") .. "/skeletons",

	-- enable/disable plugin, this supercedes disable_for_empty_file (default)
	skel_enabled = true,

	-- enable/disable processing for bufread + empty file case (default)
	apply_skel_for_empty_file = true,

	author = "Zacharyliu-CS",
	email = "liuzhenm@mail.ustc.edu.cn",

	-- file pattern -> template mappings (default)
	mappings = {
		["LICENSE"] = { "BSD_3Clause.license", "GNU_GPLv3.license", "MIT.license"},
		["*.cpp"] = "skel.cc",
		["*.cc"] = "skel.cc",
		["*.hpp"] = "skel.h",
		["*.h"] = "skel.h",
		["*.hh"] = "skel.h",
    ["*.go"] = "skel.go",
		["*.c"] = "skel.c",
		["*.py"] = "skel.py",
		["*.rs"] = "skel.rs",
		["*.lua"] = "skel.lua",
		["*.sh"] = "skel.sh",
    ["CMakeLists.txt"] = "skel.cmake",
    ["Makefile"] = "skel.make",
	},

	-- substitutions in templates (default)
	-- can be a string or a callback function
	-- these are the set of default placeholders provided by the plugin
	substitutions = {
		["FILENAME"] = skeld.get_filename,
		["NAME"] = skeld.get_author,
		["EMAIL"] = skeld.get_email,
		["DATE"] = skeld.get_date,
    ["YEAR"] = skeld.get_year,
		["CPP_HDR_GUARD"] = skeld.get_cppheaderguard,
		["CPP_TEST_HDR_GUARD"] = skeld.get_testheaderguard,
		["CPP_HDR_INCLUDE"] = skeld.get_headerinclude_quote,
		["CLASS_NAME"] = skeld.get_classname2,
	},
})
