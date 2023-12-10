local buffer = require("parsley.buffer")
local window = {}
window["get-screen-size"] = function()
  local _let_1_ = vim.api.nvim_list_uis()[1]
  local width = _let_1_["width"]
  local height = _let_1_["height"]
  return {height, width}
end
window["get-screen-pos"] = function()
  local winid = vim.api.nvim_get_current_win()
  local _let_2_ = vim.api.nvim_win_get_cursor(winid)
  local linenr = _let_2_[1]
  local column = _let_2_[2]
  local _let_3_ = vim.fn.screenpos(0, linenr, (column + 1))
  local row = _let_3_["row"]
  local col = _let_3_["col"]
  return {row, col}
end
window["get-zindex"] = function(winid)
  return vim.api.nvim_win_get_config(winid).zindex
end
window["floating?"] = function(winid)
  return (window["get-zindex"](winid) ~= nil)
end
window["visible?"] = function(winid)
  return (vim.fn.win_id2win(winid) > 0)
end
window["get-height"] = function(winid)
  local _4_, _5_ = pcall(vim.api.nvim_win_get_height, winid)
  if ((_4_ == true) and (nil ~= _5_)) then
    local height = _5_
    return height
  else
    local _ = _4_
    return 0
  end
end
window.filetype = function(winid)
  return buffer.filetype(vim.api.nvim_win_get_buf(winid))
end
window["get-info"] = function(winid)
  if vim.api.nvim_win_is_valid(winid) then
    return vim.fn.getwininfo(winid)[1]
  else
    return error(("Can't retrieve info for the invalid window " .. winid))
  end
end
return window