return {
  "epwalsh/obsidian.nvim",
  branch = "main",
  lazy = true,
  event = {
    "BufReadPre /Users/dvd/Documents/Synced/*.md",
    "BufNewFile /Users/dvd/Documents/Synced/*.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- Optional.
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim"
  },
  opts = {
    disable_frontmatter = true,
    ui = { enable = false },
    workspaces = {
      {
        name = "Synced",
        path = "/Users/dvd/Documents/Synced/",
      },
    },
  },
}
