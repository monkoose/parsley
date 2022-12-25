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
  local tbl_17_auto = {}
  local i_18_auto = #tbl_17_auto
  for _, x in ipairs(xs) do
    local val_19_auto = func(x)
    if (nil ~= val_19_auto) then
      i_18_auto = (i_18_auto + 1)
      do end (tbl_17_auto)[i_18_auto] = val_19_auto
    else
    end
  end
  return tbl_17_auto
end
local function filter(func, xs)
  local tbl_17_auto = {}
  local i_18_auto = #tbl_17_auto
  for _, x in ipairs(xs) do
    local val_19_auto
    if func(x) then
      val_19_auto = x
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
local function echo(...)
  return vim.api.nvim_echo({...}, false, {})
end
return {["null?"] = null_3f, ["string?"] = string_3f, ["list?"] = list_3f, ["hash-table?"] = hash_table_3f, ["even?"] = even_3f, ["odd?"] = odd_3f, ["empty?"] = empty_3f, first = first, second = second, map = map, filter = filter, echo = echo}