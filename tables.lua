local tables = {}

-- Initialize a new structure. Returns: table with first/last pointers.
function tables.create()
  return {first = 1, last = 0}
end

-- Add an element to the end. Inputs: (q, value). Returns: none.
function tables.push(q, valor)
  if valor == nil then return error("cannot insert nil") end
  q.last = q.last + 1
  q[q.last] = valor
end

-- Remove from the start (Queue/FIFO). Inputs: (q). Returns: removed value or nil.
function tables.dequeue(q)
  if tables.isEmpty(q) then return nil end
  local valor = q[q.first]
  q[q.first] = nil
  q.first = q.first + 1
  return valor
end

-- Remove from the end (Stack/LIFO). Inputs: (q). Returns: removed value or nil.
function tables.pop(q)
  if tables.isEmpty(q) then return nil end
  local valor = q[q.last]
  q[q.last] = nil
  q.last = q.last - 1
  return valor
end

-- Get the last element without removing. Inputs: (q). Returns: value or nil.
function tables.peekLast(q)
  return q[q.last]
end

-- Get the first element without removing. Inputs: (q). Returns: value or nil.
function tables.peekFirst(q)
  return q[q.first]
end

-- Calculate total elements. Inputs: (q). Returns: integer count.
function tables.length(q)
  return q.last - q.first + 1
end

-- Display indices and values in console. Inputs: (q). Returns: none.
function tables.print(q)
  if tables.isEmpty(q) then print("tables empty") return end
  for i = q.first, q.last do
    print(string.format("[%d]: %s", i, tostring(q[i])))
  end
end

-- Search for values. Inputs: (q, value). Returns: boolean and a table of positions.
function tables.contains(q, valor)
  local foundPositions = tables.create()
  for i = q.first, q.last do
    if q[i] == valor then
      tables.push(foundPositions, i)
    end
  end
  if not tables.isEmpty(foundPositions) then
    return true, foundPositions
  else
    return false
  end
end

-- Verify if structure has no elements. Inputs: (q). Returns: boolean.
function tables.isEmpty(q)
  return q.first > q.last
end

-- Create a shallow copy. Inputs: (q). Returns: new table with same values.
function tables.copy(q)
  local new = tables.create()
  for i = q.first, q.last do
    tables.push(new, q[i])
  end
  return new
end

-- Reorder elements in-place. Inputs: (q). Returns: the original table.
function tables.reverse(q)
  local left = q.first
  local right = q.last
  while left < right do
    local temp = q[left]
    q[left] = q[right]
    q[right] = temp
    left = left + 1
    right = right - 1
  end
  return q
end

-- Generate a new reversed table. Inputs: (q). Returns: new table.
function tables.reverseToNew(q)
  local new = tables.create()
  for i = q.last, q.first, -1 do
    tables.push(new, q[i])
  end
  return new
end

-- Delete all occurrences of a value. Inputs: (q, value). Returns: boolean.
function tables.removeValue(q, valor)
  local removedAny = false
  local writePtr = q.first
  for readPtr = q.first, q.last do
    if q[readPtr] == valor then
      q[readPtr] = nil 
      removedAny = true
    else
      if readPtr ~= writePtr then
        q[writePtr] = q[readPtr]
        q[readPtr] = nil
      end
      writePtr = writePtr + 1
    end
  end
  q.last = writePtr - 1
  return removedAny
end

-- Wipe all data and reset pointers. Inputs: (q). Returns: none.
function tables.clear(q)
  for i = q.first, q.last do q[i] = nil end
  q.first = 1
  q.last = 0
end

-- Forward iterator (first to last). Inputs: (q). Returns: iterator function.
function tables.items(q)
  local i = q.first - 1
  return function()
    i = i + 1
    if i <= q.last then return q[i] end
  end
end

-- Backward iterator (last to first). Inputs: (q). Returns: iterator function.
function tables.itemsReverse(q)
  local i = q.last + 1
  return function()
    i = i - 1
    if i >= q.first then return q[i] end
  end
end

return tables