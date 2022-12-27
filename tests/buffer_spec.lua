local psl_buf = require("parsley.buffer")
local psl = require("parsley")
local function _1_()
  local function _2_()
    local function _3_(_241)
      return vim.api.nvim_buf_delete(_241, {force = true})
    end
    return psl.map(_3_, vim.api.nvim_list_bufs())
  end
  before_each(_2_)
  local function _4_()
    local function _5_()
      vim.api.nvim_buf_set_option(0, "filetype", "fennel")
      assert.equal("fennel", psl_buf.filetype(0))
      vim.api.nvim_buf_set_option(0, "filetype", "lisp")
      return assert.equal("lisp", psl_buf.filetype(0))
    end
    return it("returns correct buffer filetype", _5_)
  end
  describe("filetype", _4_)
  local function _6_()
    local function _7_()
      local pre_length = #psl_buf["list-loaded"]()
      local bufnr = vim.api.nvim_create_buf(true, false)
      assert.equal((pre_length + 1), #psl_buf["list-loaded"](), "after adding a buffer")
      vim.api.nvim_buf_delete(bufnr, {unload = true})
      return assert.equal(pre_length, #psl_buf["list-loaded"](), "after unloading a buffer")
    end
    return it("returns correct list of loaded buffers", _7_)
  end
  describe("list-loaded", _6_)
  local function _8_()
    local bufnr = vim.fn.bufnr()
    local function _9_()
      return assert.is_true(psl_buf["empty?"](bufnr))
    end
    it("returns true for empty buffer", _9_)
    local function _10_()
      vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {"hello", "world"})
      assert.is_false(psl_buf["empty?"](bufnr))
      vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {"   "})
      assert.is_false(psl_buf["empty?"](bufnr), "blank characters is still a content")
      vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {"", ""})
      return assert.is_false(psl_buf["empty?"](bufnr), "blank lines is still a content")
    end
    return it("returns false for non-empty buffer", _10_)
  end
  describe("empty?", _8_)
  local function _11_()
    local name = "dummy"
    local function _12_()
      vim.cmd("edit dummy")
      return assert.same({true, vim.fn.bufnr(name)}, {psl_buf["exists?"](name)})
    end
    it("returns (values true bufnr) for existing buffer", _12_)
    local function _13_()
      return assert.falsy(psl_buf["exists?"](name))
    end
    return it("returns false for non-existing buffer", _13_)
  end
  describe("exists?", _11_)
  local function _14_()
    local name = "dummy"
    local function _15_()
      vim.cmd("split dummy")
      return assert.same({true, vim.api.nvim_get_current_win()}, {psl_buf["visible?"](name)})
    end
    it("returns true for existing and visible buffer in any window", _15_)
    local function _16_()
      vim.cmd("split dummy")
      vim.cmd("edit dummy_2")
      return assert.falsy(psl_buf["visible?"](name))
    end
    return it("returns false for non-visible buffer", _16_)
  end
  describe("visible?", _14_)
  local function _17_()
    local line = "hello, world!"
    local line_len = #line
    local function _18_()
      vim.api.nvim_buf_set_lines(0, 0, -1, false, {line})
      assert.equal(line_len, psl_buf["line-length"](0, 1))
      vim.api.nvim_buf_set_lines(0, 0, -1, false, {})
      return assert.equal(0, psl_buf["line-length"](0, 1))
    end
    return it("returns line length in bytes", _18_)
  end
  return describe("line-length", _17_)
end
return describe("buffer", _1_)