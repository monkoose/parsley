local function null_3f(x)
  return (x == nil)
end
local function string_3f(x)
  return (type(x) == "string")
end
local function list_3f(x)
  return vim.tbl_islist(x)
end
local function hash_table_3f(t)
  return ((type(t) == "table") and (#t == 0))
end
local function function_3f(x)
  return (type(x) == "function")
end
local function even_3f(n)
  return ((n % 2) == 0)
end
local function odd_3f(n)
  return not even_3f(n)
end
local function empty_3f(xs)
  return (not xs or (#xs == 0))
end
local function first(xs)
  return xs[1]
end
local function second(xs)
  return xs[2]
end
local function map(func, xs)
  local tbl_18_auto = {}
  local i_19_auto = 0
  for _, x in ipairs(xs) do
    local val_20_auto = func(x)
    if (nil ~= val_20_auto) then
      i_19_auto = (i_19_auto + 1)
      do end (tbl_18_auto)[i_19_auto] = val_20_auto
    else
    end
  end
  return tbl_18_auto
end
local function filter(func, xs)
  local tbl_18_auto = {}
  local i_19_auto = 0
  for _, x in ipairs(xs) do
    local val_20_auto
    if func(x) then
      val_20_auto = x
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
local function echo(...)
  return vim.api.nvim_echo({...}, false, {})
end
local function mod(divident, divisor)
  return math.floor((divident / divisor)), (divident % divisor)
end
return {["null?"] = null_3f, ["string?"] = string_3f, ["list?"] = list_3f, ["hash-table?"] = hash_table_3f, ["function?"] = function_3f, ["even?"] = even_3f, ["odd?"] = odd_3f, ["empty?"] = empty_3f, first = first, second = second, map = map, filter = filter, echo = echo, mod = mod}