local fn = vim.fn

local home_dir = os.getenv("HOME")
local jabba_jdk_dir = home_dir .. "/.jabba/jdk/"
local nvim_dir = home_dir .. "/.config/nvim"
local project_name = fn.fnamemodify(fn.getcwd(), ":p:h:t")
local workspace_root_dir = nvim_dir .. "/workspace/"
local workspace_dir = workspace_root_dir .. project_name
local is_file_exist = function(path)
	local f = io.open(path, "r")
	return f ~= nil and io.close(f)
end
local get_lombok_javaagent = function()
	local lombok_dir = home_dir .. "/.m2/repository/org/projectlombok/lombok/"
	local lombok_versions = io.popen('ls -1 "' .. lombok_dir .. '" | sort -r')
	if lombok_versions ~= nil then
		local lb_i, lb_versions = 0, {}
		for lb_version in lombok_versions:lines() do
			lb_i = lb_i + 1
			lb_versions[lb_i] = lb_version
		end
		lombok_versions:close()
		if next(lb_versions) ~= nil then
			local lombok_jar = fn.expand(string.format("%s%s/*.jar", lombok_dir, lb_versions[1]))
			if is_file_exist(lombok_jar) then
				return string.format("--jvm-arg=-javaagent:%s", lombok_jar)
			end
		end
	end
	return ""
end
local get_cmd = function()
	local cmd = {

		-- 💀
		"/home/phuong/jdt/bin/jdtls",
	}

	local lombok_javaagent = get_lombok_javaagent()
	if lombok_javaagent ~= "" then
		table.insert(cmd, lombok_javaagent)
	end

	-- 💀
	-- See `data directory configuration` section in the README
	table.insert(cmd, "-data")
	table.insert(cmd, workspace_dir)

	return cmd
end
local config = {
	-- cmd = { "/home/phuong/jdt/bin/jdtls" },
	cmd = get_cmd(),
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}
require("jdtls").start_or_attach(config)
