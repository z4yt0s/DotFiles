-------------------------------------------------------------------------------
-- FUNCTIONS.LUA
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Vars Ands Imports
-------------------------------------------------------------------------------
local M = {}

local api = vim.api
local cmd = vim.cmd
local fn = vim.fn
local opt_local = vim.opt_local
local keymap = vim.api.nvim_set_keymap
-------------------------------------------------------------------------------
-- Keymaps
-------------------------------------------------------------------------------
-- normal mode keybinding setter
function M.nm(key, command, noremap, silent)
  noremap = noremap or true
  silent = silent or true
  keymap('n', key, command, { noremap = true, silent = true})
end

-- input mode keybinding setter
function M.im(key, command)
  noremap = noremap or true
  silent = silent or true
  keymap('i', key, command, { noremap = true, silent = true})
end

-- visual mode keybinding setter
function M.vm(key, command)
  noremap = noremap or true
  silent = silent or true
  keymap('v', key, command, { noremap = true, silent = true})
end

-- terminal mode keybinding setter
function M.tm(key, command)
  noremap = noremap or true
  silent = silent or true
  keymap('t', key, command, { noremap = true, silent = true})
end

function M.put_code(lines)
  local row, _ = unpack(api.nvim_win_get_cursor(0))
  api.nvim_buf_set_lines(0, row - 1, row - 1, false, lines)
end

-------------------------------------------------------------------------------
-- Splits
-------------------------------------------------------------------------------
function M.swap_splits()
  -- get actual split and him size
  local current_win = api.nvim_get_current_win()
  local current_height = api.nvim_win_get_height(current_win)
  local current_width = api.nvim_win_get_width(current_win)

  -- move to next split
  cmd('wincmd w')

  -- get next split and him size
  local next_win = api.nvim_get_current_win()
  local next_height = api.nvim_win_get_height(next_win)
  local next_width = api.nvim_win_get_width(next_win)

  -- adjust dimensions of the next split to the current split
  api.nvim_win_set_height(next_win, current_height)
  api.nvim_win_set_width(next_win, current_width)

  -- swap the windows
  cmd('wincmd x')

  -- set the size of original split
  api.nvim_win_set_height(current_win, next_height)
  api.nvim_win_set_width(current_win, next_width)

  -- get to original split
  api.nvim_set_current_win(current_win)
end

-------------------------------------------------------------------------------
-- Cursor
-------------------------------------------------------------------------------
-- sets the cursor to a vertical to prevent block cursor in Alacritty on exit
cmd([[
  function! ExitCursor()
    set guicursor=c-n:ver1
    quit!
  endfunction
]])

--------------------------------------------------------------------------------
-- Terminal
--------------------------------------------------------------------------------
-- set the configuration mode
function M.setup_term_mode()
  api.nvim_buf_set_name(0, "Term")
  opt_local.number = false
  opt_local.relativenumber = false
  opt_local.signcolumn = "no"
  opt_local.winhighlight = "Normal:Normal"
  opt_local.list = false
  opt_local.laststatus = 0
  opt_local.showcmd = false
  opt_local.cmdheight = 0
  cmd('startinsert')
end

function M.toggle_term()
  local term_buff = false

  -- locate terminal buffer
  for _, buff in ipairs(api.nvim_list_bufs()) do
    if string.find(api.nvim_buf_get_name(buff), "Term") then
      print('Ya hay un buffer')
      term_buff = true
      break
    end
  end

  -- create terminal buffer if not localizated
  if not term_buf then
    print('no hay un buffer')
    cmd("botright split | resize 15 | terminal")
    M.setup_term_mode()
    return
  end

  -- Verificar si el buffer de la terminal está visible
  local buf_visible = false
  for _, win in ipairs(api.nvim_list_wins()) do
    if api.nvim_win_get_buf(win) == term_buff then
      buf_visible = true
      break
    end
  end

  -- Si el buffer no está visible, abrirlo de nuevo
  if not buf_visible then
    cmd("botright split | resize 15 | b " .. term_buff)
  else
    cmd("b " .. term_buff)
  end
end

-------------------------------------------------------------------------------
-- Functionalities
-------------------------------------------------------------------------------
-- Inserts an empty line above or below without moving the cursor
function M.add_empty_line(direction)
  if direction == 'up' then
    api.nvim_command('normal! O')

  elseif direction == 'down' then
    local c_pos = api.nvim_win_get_cursor(0)
    api.nvim_command('normal! o')
    api.nvim_win_set_cursor(0, c_pos)
  end
end

return M

