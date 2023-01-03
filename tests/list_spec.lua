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
describe("concat", _1_)
local function _3_()
  local function _4_()
    local list = {1, 2, 3, 4, 5, 6}
    psl_list["reverse!"](list)
    assert.same({6, 5, 4, 3, 2, 1}, list)
    psl_list["reverse!"](list)
    return assert.same({1, 2, 3, 4, 5, 6}, list)
  end
  it("reverses a list in place", _4_)
  local function _5_()
    local list = {1, 2, 3, 4, 5}
    return assert.same({5, 4, 3, 2, 1}, psl_list["reverse!"](list))
  end
  return it("returns reversed list", _5_)
end
return describe("reverse!", _3_)