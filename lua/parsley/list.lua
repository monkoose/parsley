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
return {concat = concat}