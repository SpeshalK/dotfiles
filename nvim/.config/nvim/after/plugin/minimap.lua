local map = require('mini.map')

map.setup({
    integrations = {
      map.gen_integration.builtin_search(),
      map.gen_integration.gitsigns(),
      map.gen_integration.diagnostic(),
    },
    symbols = {
      -- Encode symbols. See `:h MiniMap.config` for specification and
      -- `:h MiniMap.gen_encode_symbols` for pre-built ones.
      -- Default: solid blocks with 3x2 resolution.
      encode = nil,

      -- Scrollbar parts for view and line. Use empty string to disable any.
      --  - View - '╎', '┋', '┋'.
      --scroll_line = '█',
      --scroll_view = '┃',
      scroll_line = '▶',
      scroll_view = '┃',
    },
  })
