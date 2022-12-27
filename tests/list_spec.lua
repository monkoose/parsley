local psl_list = require("parsley.list")
local function _1_()
  local function _2_()
    assert.same({1, 2, 3, 4, 5, 6}, psl_list.concat({1, 2}, {3, 4}, {5, 6}))
    assert.same({"hello", "world"}, psl_list.concat({"hello"}, {"world"}))
    assert.same({"hello"}, psl_list.concat({"hello"}))
    return assert.same({}, psl_list.concat({}))
  end
  return it("correctly concatenates mulitple lists", _2_)
end
return describe("concat", _1_)