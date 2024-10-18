--------------------------------------------------------------------------------
-- KEYBINDINGS
--------------------------------------------------------------------------------
local nm = require("helpers.functions").nm
local im = require("helpers.functions").im
local tm = require("helpers.functions").tm
local vm = require("helpers.functions").vm

-- scape mode
-- ???

nm('<Space>', '<Nop')
nm('<CR>', '<Nop>')

nm('<CR>', ':AddLine down<CR>')
nm('<C-CR>', ':AddLine up<CR>')

--------------------------------------------------------------------------------
-- Splits And Windows
--------------------------------------------------------------------------------
-- basic movements
nm('<C-l>', '<C-w>l')
nm('<C-k>', '<C-w>k')
nm('<C-j>', '<C-w>j')
nm('<C-h>', '<C-w>h')

-- move next and after split
nm('<A-z>', '<C-w>W')
nm('<A-y>', '<C-w>w')

-- resize splits
nm('<A-l>', ':vertical resize +4<CR>')
nm('<A-h>', ':vertical resize -4<CR>')
nm('<A-k>', ':resize +4<CR>')
nm('<A-j>', ':resize -4<CR>')

-- splits manipulation
nm('<C-c>', '<C-w>c')                   -- close split
nm('<C-a>', '<C-w>o')                   -- close others except actual
nm('<C-s>', ':SwapSplits<CR>')          -- swap split with the next
nm('<C-h>', ':hide<CR>')                -- hide current window

--------------------------------------------------------------------------------
-- File Functions
--------------------------------------------------------------------------------
nm('<leader>w', ':w<CR>')                           -- safe
nm('<leader>q', ':w<CR>:call ExitCursor()<CR>')     -- safe and exit
nm('<leader>e', ':q<CR>')                           -- exit

--------------------------------------------------------------------------------
-- Terminal
--------------------------------------------------------------------------------
--nm('<leader>t', ':botright split | resize 15 | :terminal<CR>')  -- open term
nm("<leader>t", ":ToggleTerm<CR>")

-- allow 
tm('<C-[>', [[<C-\><C-n>]])

--------------------------------------------------------------------------------
-- Templates
--------------------------------------------------------------------------------
nm('<leader>nc', ':lua neovim_comments()<CR>')
nm('<leader>ncc', ':lua neovim_custom_commands()<CR>')

--------------------------------------------------------------------------------
-- Templates Python
--------------------------------------------------------------------------------
nm('<leader>pa', ':lua python_file_level_comments()<CR>')
nm('<leader>pm', ':lua python_main_template()<CR>')


