local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

---@diagnostic disable-next-line: unused-local
local opts = {}

require("vim-options")
require("remaps")
require("lazy").setup("plugins")
require("Comment").setup()

vim.api.nvim_create_user_command('RunTheme', function(opts)
  local theme = opts.fargs[1]
  local subtheme = opts.fargs[2] or ""

  -- Define o colorscheme no Neovim
  if subtheme ~= "" then
    vim.cmd('colorscheme ' .. theme .. '-' .. subtheme)
  else
    vim.cmd('colorscheme ' .. theme)
  end

  -- Executa o script para alterar o fundo do terminal
  local shell_command = "~/.local/bin/theme " .. theme
  if subtheme ~= "" then
    shell_command = shell_command .. " " .. subtheme
  end

  local handle = io.popen(shell_command)
  local result = handle:read("*a")
  handle:close()

  -- Imprime o resultado da execução do script
  print(result)
end, {
  nargs = "+", -- Aceita um ou dois argumentos
  complete = function(arglead, cmdline, cursorpos)
    return {"catppuccin", "catppuccin latte", "catppuccin frappe", "catppuccin macchiato", "catppuccin mocha", "tokyonight", "tokyonight day", "tokyonight moon", "tokyonight night", "tokyonight storm", "dracula", "dracula soft", "gruvbox", "nightfox", "nord" }
  end
})
