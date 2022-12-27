local psl_win = require("parsley.window")
local function _1_()
  local function _2_()
    local function _3_()
      return assert.is_nil(psl_win["get-zindex"](vim.api.nvim_get_current_win()))
    end
    it("returns nil for a non-floating window", _3_)
    local function _4_()
      local zindex = 99
      vim.api.nvim_open_win(0, true, {width = 10, height = 10, zindex = zindex, relative = "editor", row = 1, col = 1})
      return assert.same(zindex, psl_win["get-zindex"](0))
    end
    return it("returns zindex value of a floating window", _4_)
  end
  describe("get-zindex", _2_)
  local function _5_()
    local function _6_()
      return assert.is_true(psl_win["floating?"](0))
    end
    it("returns true for a floating window", _6_)
    local function _7_()
      vim.api.nvim_win_close(0, true)
      return assert.is_false(psl_win["floating?"](0))
    end
    return it("returns false for a normal window", _7_)
  end
  describe("floating?", _5_)
  local function _8_()
    vim.cmd("split dummy")
    local winid = vim.api.nvim_get_current_win()
    vim.cmd("split dummy_2")
    local function _9_()
      return assert.is_true(psl_win["visible?"](winid))
    end
    it("returns true for a visible window in the current tabpage", _9_)
    local function _10_()
      vim.api.nvim_win_close(winid, true)
      return assert.is_false(psl_win["visible?"](winid))
    end
    return it("returns false for an non-visible window in the current tabpage", _10_)
  end
  describe("visible?", _8_)
  local function _11_()
    local winid = vim.api.nvim_get_current_win()
    local function _12_()
      return assert.equal(vim.api.nvim_win_get_height(winid), psl_win["get-height"](winid))
    end
    it("returns height of a valid window", _12_)
    local function _13_()
      return assert.equal(0, psl_win["get-height"](333))
    end
    return it("returns 0 for a non-valid window", _13_)
  end
  describe("get-height", _11_)
  local function _14_()
    vim.api.nvim_buf_set_option(0, "filetype", "javascript")
    local function _15_()
      return assert.equal("javascript", psl_win.filetype(0))
    end
    return it("returns correct filetype for a buffer in the window", _15_)
  end
  describe("filetype", _14_)
  local function _16_()
    local function _17_()
      local wininfo = (vim.fn.getwininfo(0))[1]
      assert.same(wininfo, psl_win["get-info"](0))
      local function _18_()
        return psl_win["get-info"](333)
      end
      return assert.has.error(_18_)
    end
    return it("returns info table for a valid window", _17_)
  end
  return describe("get-info", _16_)
end
return describe("window", _1_)