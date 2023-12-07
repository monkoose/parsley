local function concat(list, ...)
  local result = {}
  do
    local tbl_17_auto = result
    for _, val in ipairs(list) do
      table.insert(tbl_17_auto, val)
    end
  end
  if ... then
    for _, l in ipairs({...}) do
      local tbl_17_auto = result
      for _0, v in ipairs(l) do
        table.insert(tbl_17_auto, v)
      end
    end
  else
  end
  return result
end
local function reverse_21(list)
  local list_len = #list
  for i = 1, math.floor((list_len / 2)) do
    local j = ((list_len - i) + 1)
    local temp_i = list[i]
    list[i] = list[j]
    list[j] = temp_i
  end
  return list
end
return {concat = concat, ["reverse!"] = reverse_21}