local M = {}

local which_command = {
  ["windows_nt"] = "where",
  ["linux"] = "which",
  ["darwin"] = "which",
}
local sysname = string.lower(vim.uv.os_uname().sysname)

function M.which(command)
  if not which_command[sysname] then return nil end

  local w_command = which_command[sysname]

  local result = vim.fn.system { w_command, command }

  if vim.v.shell_error ~= 0 then
    return nil
  else
    result = string.gsub(result, "^%s*(.-)%s*$", "%1")
    local paths = {}
    for path in string.gmatch(result, "([^\n]+)") do
      table.insert(paths, path)
    end
    return paths
  end
end

return M
