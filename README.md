# lua-tables-deque
A high-performance Deque (Queue/Stack) library for Lua.

# Tables.lua (Deque Library)

A high-performance **Double-Ended Queue (Deque)** implementation for Lua. This library provides a unified structure to handle **Queues** (FIFO), **Stacks** (LIFO), and general-purpose list manipulations with efficiency.

## 🚀 Features

*   **Fast Operations:** `push`, `pop`, and `dequeue` run in $O(1)$ time.
*   **Memory Managed:** Automatically clears internal references to support the Lua Garbage Collector.
*   **Sequential Reliability:** Uses internal pointers (`first`/`last`) to avoid common pitfalls with the Lua `#` operator.
*   **Built-in Iterators:** Native support for forward and reverse traversal.

## 📦 Installation

Download [tables.lua](tables.lua) and place it in your project directory. Load it using:

local tables = require("tables")

## 🛠️ Quick Start
Note: Always initialize your structure with tables.create() before use.

*  **As a Queue (First-In, First-Out)**

local queue = tables.create()  
tables.push(queue, "Order 1")  
tables.push(queue, "Order 2")  

print(tables.dequeue(queue)) -- Output: Order 1

*  **As a Stack (Last-In, First-Out)**

local stack = tables.create()  
tables.push(stack, "Level 1")  
tables.push(stack, "Level 2")  

print(tables.pop(stack)) -- Output: Level 2

## 🔍 Advanced Search Example

local list = tables.create()  
tables.push(list, "A")  
tables.push(list, "B")  
tables.push(list, "A")  

local found, positions = tables.contains(list, "A")  
if found then  
  print("Found 'A' at indices:")  
  tables.print(positions)  
end

## 📖 API Reference
*  **Function	Description**
*  `create()`	Initializes a new structure.
*  `push(q, val)`	Adds an element to the end.
*  `dequeue(q)`	Removes and returns the first element.
*  `pop(q)`	Removes and returns the last element.
*  `peekFirst(q)`	Returns the first element without removing it.
*  `peekLast(q)`	Returns the last element without removing it.
*  `length(q)`	Returns the total number of elements.
*  `contains(q, val)`	Returns true and a table of positions if found.
*  `reverse(q)`	Reverses the structure in-place.
*  `removeValue(q, val)`	Removes all occurrences of a specific value.
*  `tems(q)`	Returns a forward iterator for for loops.
*  `itemsReverse(q)`	Returns a backward iterator for for loops.


## 📄 License
This project is open-source and available under the MIT License.
##
For the [Lua Community](https://www.lua.org/).
