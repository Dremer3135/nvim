require("nvchad.configs.lspconfig").defaults()

local svelte_plugin_path = vim.fn.stdpath "data" .. "/mason/packages/svelte-language-server/node_modules/typescript-svelte-plugin"

local ts_plugins = {}
if vim.uv.fs_stat(svelte_plugin_path) then
  table.insert(ts_plugins, {
    name = "typescript-svelte-plugin",
    location = svelte_plugin_path,
    languages = { "svelte" },
  })
end

if #ts_plugins > 0 then
  vim.lsp.config("ts_ls", {
    init_options = {
      plugins = ts_plugins,
    },
  })
end

-- Explicitly enable CSS and HTML completions (including Emmet) in Svelte
vim.lsp.config("svelte", {
  settings = {
    svelte = {
      plugin = {
        css = {
          enable = true,
          hover = { enable = true },
          completions = { enable = true, emmet = true },
        },
        html = {
          enable = true,
          hover = { enable = true },
          completions = { enable = true, emmet = true },
        },
      },
    },
  },
})

-- Enable snippet capability for cssls (required by vscode-css-language-server for completions)
local css_capabilities = vim.lsp.protocol.make_client_capabilities()
css_capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("cssls", {
  capabilities = css_capabilities,
})

local servers = {
  "html",
  "cssls",
  "omnisharp",
  "svelte",
  "ts_ls",
  "emmet_language_server",
  "tailwindcss",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
 
