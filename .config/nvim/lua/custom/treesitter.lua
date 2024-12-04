local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  ensure_installed = { "vimdoc", "bash", "typescript", "javascript", "lua", "rust", "nix" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
    disable = { "xml" },
  },
  rainbow = {
    enable = true,
    colors = {
      "Gold",
      "Orchid",
      "DodgerBlue",
      "Salmon",
    },
    disable = { "html" },
  },
  playground = {
    enable = true,
  },
})
