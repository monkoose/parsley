local psl = require("parsley")
local buffer = {}
buffer.filetype = function(bufnr)
  return vim.api.nvim_buf_get_option(bufnr, "filetype")
end
buffer["list-loaded"] = function()
  local tbl_18_auto = {}
  local i_19_auto = 0
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    local val_20_auto
    if vim.api.nvim_buf_is_loaded(buf) then
      val_20_auto = buf
    else
      val_20_auto = nil
    end
    if (nil ~= val_20_auto) then
      i_19_auto = (i_19_auto + 1)
      do end (tbl_18_auto)[i_19_auto] = val_20_auto
    else
    end
  end
  return tbl_18_auto
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
buffer["get-var!"] = function(bufnr, variable, _3fdefault)
  local _6_, _7_ = pcall(vim.api.nvim_buf_get_var, bufnr, variable)
  if ((_6_ == true) and (nil ~= _7_)) then
    local val = _7_
    return val
  else
    local _ = _6_
    if _3fdefault then
      vim.api.nvim_buf_set_var(bufnr, variable, _3fdefault)
      return vim.api.nvim_buf_get_var(bufnr, variable)
    else
      return nil
    end
  end
end
buffer["line-length"] = function(bufnr, linenr)
  return #psl.first(vim.api.nvim_buf_get_lines(bufnr, (linenr - 1), linenr, false))
end
return buffer