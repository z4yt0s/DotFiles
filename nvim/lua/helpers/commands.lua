--------------------------------------------------------------------------------
-- COMMANDS
--------------------------------------------------------------------------------
local set_command = vim.api.nvim_create_user_command

set_command(
  "AddLine",
  function(opts)
    local add_empty_line = require("helpers.functions").add_empty_line
    add_empty_line(opts.args)
  end,
  { nargs = 1 }
)

set_command(
  "SwapSplits",
  function()
    local swap_splits = require("helpers.functions").swap_splits
    swap_splits()
  end,
  { nargs = 0 }
)

--set_command(
--  "SetupTermMode",
--  function()
--    local setup_term_mode = require("helpers.functions").setup_term_mode
--    setup_term_mode()
--  end,
--  { nargs = 0 }
--)

set_command(
  "ToggleTerm",
  function(opts)
    local toggle_term = require("helpers.functions").toggle_term
    toggle_term()
  end,
  { nargs = 0 }
)

