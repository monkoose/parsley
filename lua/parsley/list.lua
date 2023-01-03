local function concat(list, ...)
  local result = {}
  do
    local tbl_17_auto = result
    local i_18_auto = #tbl_17_auto
    for _, val in ipairs(list) do
      local val_19_auto = val
      if (nil ~= val_19_auto) then
        i_18_auto = (i_18_auto + 1)
        do end (tbl_17_auto)[i_18_auto] = val_19_auto
      else
      end
    end
  end
  if ... then
    for _, l in ipairs({...}) do
      local tbl_17_auto = result
      local i_18_auto = #tbl_17_auto
      for _0, v in ipairs(l) do
        local val_19_auto = v
        if (nil ~= val_19_auto) then
          i_18_auto = (i_18_auto + 1)
          do end (tbl_17_auto)[i_18_auto] = val_19_auto
        else
        end
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