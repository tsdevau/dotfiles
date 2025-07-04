-- Return nothing to enable Lazyvim to control the plugin
if true then return {} end
-- copilot.lua config
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = true },
      panel = { enabled = true },
      filetypes = {
        astro = true,
        markdown = true,
        typescript = true,
        typescriptreact = true,
        javascript = true,
        javascriptreact = true,
        svelte = true,
        html = true,
        css = true,
        json = true,
        yaml = true,
        toml = true,
        lua = true,
        python = true,
        rust = true,
        go = true,
        help = true,
      },
    },
  },
}
