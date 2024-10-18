--------------------------------------------------------------------------------
-- TEMPLATES
--------------------------------------------------------------------------------
local put_code = require("helpers.functions").put_code

--------------------------------------------------------------------------------
-- Neovim
--------------------------------------------------------------------------------
function neovim_comments()
  local large_comment = string.rep("-", 80)
  local lines = {
    large_comment,
    "--",
    large_comment,
    }
  put_code(lines)
end

function neovim_custom_commands()
  local lines = {
    'set_command(',
    '  "",',
    '  function(opts)',
    '    ',
    '  end,',
    '  { nargs = 0 }',
    ')'
  }
  put_code(lines)
end

--------------------------------------------------------------------------------
-- Python
--------------------------------------------------------------------------------
function py_file_level_comments()
  local lines = {
    '# @author: z4yt0s',
    '# @github: https://github.com/z4yt0s/{specific_repo}',
    '# @date: ' .. os.date('%m-%d-%Y'),
    '# @description: {...}'
  }
  put_code(lines)
end

function py_main_template()
  local lines = {
    'def main():',
    '    pass',
    '',
    'if __name__ == \'__main__\':',
    '    main()'
  }
  put_code(lines)
end

