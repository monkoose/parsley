local psl = require("parsley")
local function _1_()
  local function _2_()
    assert.is_true(psl["even?"](2))
    assert.is_true(psl["even?"](10))
    assert.is_true(psl["even?"](-2), "Negative numbers should pass")
    return assert.is_true(psl["even?"](0), "Zero is even.")
  end
  it("returns true for even numbers", _2_)
  local function _3_()
    assert.is_false(psl["even?"](1))
    assert.is_false(psl["even?"](111))
    return assert.is_false(psl["even?"](-1), "Negative numbers should pass")
  end
  return it("returns false for odd numbers", _3_)
end
describe("even?", _1_)
local function _4_()
  local function _5_()
    assert.is_true(psl["odd?"](3))
    assert.is_true(psl["odd?"](111))
    return assert.is_true(psl["odd?"](-1), "Negative numbers should pass")
  end
  it("returns true for odd numbers", _5_)
  local function _6_()
    assert.is_false(psl["odd?"](112))
    assert.is_false(psl["odd?"](-2), "Negative numbers should pass")
    return assert.is_false(psl["odd?"](0), "Zero is even.")
  end
  return it("returns false for even numbers", _6_)
end
describe("odd?", _4_)
local function _7_()
  local function _8_()
    assert.is_true(psl["string?"](""))
    return assert.is_true(psl["string?"]("hello"))
  end
  it("returns true for a string", _8_)
  local function _9_()
    assert.is_false(psl["string?"](nil))
    assert.is_false(psl["string?"]({1, 2, 3}))
    return assert.is_false(psl["string?"](3))
  end
  return it("returns false for not a string", _9_)
end
describe("string?", _7_)
local function _10_()
  local function _11_()
    return assert.is_true(psl["null?"](nil))
  end
  it("returns true for a nil", _11_)
  local function _12_()
    assert.is_false(psl["null?"]("hello"))
    assert.is_false(psl["null?"](false))
    return assert.is_false(psl["null?"]({}))
  end
  return it("returns false for not a nil", _12_)
end
describe("null?", _10_)
local function _13_()
  local function _14_()
    assert.is_true(psl["list?"]({1, 2, 3}))
    return assert.is_true(psl["list?"]({}))
  end
  it("returns true for a list (sequential table)", _14_)
  assert.is_true(psl["list?"]({}), "Empty hash table is a list")
  local function _15_()
    assert.is_false(psl["list?"]("hello"))
    assert.is_false(psl["list?"](nil))
    return assert.is_false(psl["list?"]({hello = true}))
  end
  return it("returns false for not a list", _15_)
end
describe("list?", _13_)
local function _16_()
  local function _17_()
    assert.is_true(psl["hash-table?"]({hello = true}))
    assert.is_true(psl["hash-table?"]({}))
    return assert.is_true(psl["hash-table?"]({}), "Empty list is a hash table")
  end
  it("returns true for a hash table", _17_)
  local function _18_()
    assert.is_false(psl["hash-table?"]("hello"))
    assert.is_false(psl["hash-table?"](nil))
    return assert.is_false(psl["hash-table?"]({1, 2, 3}))
  end
  return it("returns false for not a hash table", _18_)
end
describe("hash-table?", _16_)
local function _19_()
  local function _20_()
    return assert.is_true(psl["empty?"](nil), assert.is_true(psl["empty?"]({})))
  end
  it("returns true for empty list or nil", _20_)
  local function _21_()
    assert.is_false(psl["empty?"]({1, 2, 3}))
    return assert.is_false(psl["empty?"]({"x"}))
  end
  return it("returns false for not empty list", _21_)
end
describe("empty?", _19_)
local function _22_()
  local list = {"a", "b", "c"}
  local function _23_()
    assert.equal("a", psl.first(list))
    assert["not"].equal("b", psl.first(list))
    return assert["not"].equal("c", psl.first(list))
  end
  return it("returns first element from a list", _23_)
end
describe("first", _22_)
local function _24_()
  local list = {"a", "b", "c"}
  local function _25_()
    assert.equal("b", psl.second(list))
    assert["not"].equal("a", psl.second(list))
    return assert["not"].equal("c", psl.second(list))
  end
  return it("returns second element from a list", _25_)
end
describe("second", _24_)
local function _26_()
  local function _27_()
    local function _28_(_241)
      return (2 * _241)
    end
    assert.same({2, 4, 6}, psl.map(_28_, {1, 2, 3}))
    local function _29_(_241)
      return string.sub(_241, 1, 1)
    end
    return assert.same({"a", "b", "c"}, psl.map(_29_, {"ab", "bc", "cd"}))
  end
  return it("returns correct list", _27_)
end
describe("map", _26_)
local function _30_()
  local function _31_()
    local function _32_(_241)
      return psl["odd?"](_241)
    end
    assert.same({1, 3, 5}, psl.filter(_32_, {1, 2, 3, 4, 5}))
    local function _33_(_241)
      return string.find(_241, "^hell")
    end
    return assert.same({"hello"}, psl.filter(_33_, {"helio", "hello", "good"}))
  end
  return it("returns correct list", _31_)
end
return describe("filter", _30_)