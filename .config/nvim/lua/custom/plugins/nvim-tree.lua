return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    renderer = {
      icons = {
        glyphs = {
          git = {
            ignored = "I",
          },
        },
      },
    },
    git = {
      ignore = false,
    },
  },
}
