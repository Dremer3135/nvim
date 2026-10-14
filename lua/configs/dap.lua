local dap = require "dap"
local dapui = require "dapui"

dapui.setup()
require("nvim-dap-virtual-text").setup()

-- Automatically open and close DAP UI with debug sessions
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- Adapter configuration using netcoredbg
local mason_bin = vim.fn.stdpath "data" .. "/mason/bin/netcoredbg"
local netcoredbg_path = vim.fn.executable(mason_bin) == 1 and mason_bin or "netcoredbg"

dap.adapters.coreclr = {
  type = "executable",
  command = netcoredbg_path,
  args = { "--interpreter=vscode" },
}

-- Smart dll finder: automatically picks the compiled dll in bin/Debug/net*/*.dll
local function get_dll_path()
  local cwd = vim.fn.getcwd()
  local matches = vim.fn.glob(cwd .. "/**/bin/Debug/net*/*.dll", false, true)
  local valid = {}
  for _, path in ipairs(matches) do
    if not path:match "/ref/" and not path:match "%.Views%.dll$" then
      table.insert(valid, path)
    end
  end
  if #valid == 1 then
    return valid[1]
  end
  return vim.fn.input("Path to dll: ", cwd .. "/bin/Debug/", "file")
end

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "Launch C# (netcoredbg)",
    request = "launch",
    program = get_dll_path,
    cwd = "${workspaceFolder}",
    stopAtEntry = false,
  },
}
