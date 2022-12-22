local psl = require("parsley")
local buffer = {}
buffer.filetype = function(bufnr)
  return vim.api.nvim_buf_get_option(bufnr, "filetype")
end
buffer["list-loaded"] = function()
  local tbl_17_auto = {}
  local i_18_auto = #tbl_17_auto
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    local val_19_auto
    if vim.api.nvim_buf_is_loaded(buf) then
      val_19_auto = buf
    else
      val_19_auto = nil
    end
    if (nil ~= val_19_auto) then
      i_18_auto = (i_18_auto + 1)
      do end (tbl_17_auto)[i_18_auto] = val_19_auto
    else
    end
  end
  return tbl_17_auto
end
buffer["empty?"] = function(bufnr)
  local last_linenr = vim.api.nvim_buf_line_count(bufnr)
  return ((last_linenr == 1) and (0 == #psl.first(vim.api.nvim_buf_get_lines(bufnr, 0, 1, false))))
end
buffer["exists?"] = function(bufname)
  if (vim.fn.bufexists(bufname) == 1) then
    return true, vim.fn.bufnr(bufname)
  else
    return nil
  end
end
buffer["visible?"] = function(bufname)
  local _4_ = vim.fn.bufwinid(bufname)
  if (_4_ == -1) then
    return nil
  elseif (nil ~= _4_) then
    local winid = _4_
    return true, winid
  else
    return nil
  end
end
return buffer