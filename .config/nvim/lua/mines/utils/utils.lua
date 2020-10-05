local vim = vim

local M = {}

function M.reduce(list, accumulator, start_value)
  local result = start_value

  for i,value in ipairs(list) do
    result = accumulator(result, value, i)
  end

  return result
end

function M.map(list, mapper)
  return M.reduce(list, function(res, item, i)
    table.insert(res, mapper(item, i))

    return res
  end, {})
end

function M.filter(list, predicate)
  return M.reduce(list, function(res, item, i)
    if predicate(item, i) then
      table.insert(res, item)
    end

    return res
  end, {})
end

function M.find(list, predicate)
  for i,v in ipairs(list) do
    if predicate(v,i) then
      return v, i
    end
  end
end

function M.join(list, delimiter)
  return M.reduce(list, function(res, item)
    return res == '' and tostring(item) or (res .. delimiter .. tostring(item))
  end, '')
end

function M.split(str, split_on)
  local result = {}

  for i in string.gmatch(str .. split_on, "([^" .. split_on .. "]+)" .. split_on) do
    table.insert(result, i)
  end

  return result
end

function M.concat(list1, list2)
  return M.reduce(list2, function(res, item)
    table.insert(res, item)

    return res
  end, { unpack(list1) })
end

function M.indexOf(list, value)
  for i,v in ipairs(list) do
    if v == value then return i end
  end

  return nil
end

function M.humanize_bytes(size)
    local div = 1024
    if size < div then return tostring(size) end
    for _, unit in ipairs({"", "k", "M", "G", "T", "P", "E", "Z"}) do
        if size < div then return string.format("%.1f%s", size, unit) end
        size = size / div
    end
end

-- Error handling
function M.npcall(fn, ...)
    local ok_or_nil = function(status, ...)
        if not status then return end
        return ...
    end
    return ok_or_nil(pcall(fn, ...))
end

return M
