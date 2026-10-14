require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "kj", "<ESC>")

-- C# Run, Build, and Test (using NvChad runner in split window)
map("n", "<leader>cr", function()
  require("nvchad.term").runner {
    pos = "sp",
    cmd = "dotnet run",
    id = "csharp_runner",
    clear_cmd = false,
  }
end, { desc = "C# Run (dotnet run)" })

map("n", "<leader>cb", function()
  require("nvchad.term").runner {
    pos = "sp",
    cmd = "dotnet build",
    id = "csharp_runner",
    clear_cmd = false,
  }
end, { desc = "C# Build (dotnet build)" })

map("n", "<leader>ct", function()
  require("nvchad.term").runner {
    pos = "sp",
    cmd = "dotnet test",
    id = "csharp_runner",
    clear_cmd = false,
  }
end, { desc = "C# Test (dotnet test)" })

-- Debugger (DAP) Keymaps
map("n", "<F5>", function()
  require("dap").continue()
end, { desc = "DAP Continue / Start" })

map("n", "<F10>", function()
  require("dap").step_over()
end, { desc = "DAP Step Over" })

map("n", "<F11>", function()
  require("dap").step_into()
end, { desc = "DAP Step Into" })

map("n", "<F12>", function()
  require("dap").step_out()
end, { desc = "DAP Step Out" })

map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP Toggle Breakpoint" })

map("n", "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "DAP Conditional Breakpoint" })

map("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "DAP Toggle UI" })

map("n", "<leader>dq", function()
  require("dap").terminate()
end, { desc = "DAP Terminate" })
