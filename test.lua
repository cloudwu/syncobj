local syncobj = require "syncobj"

local source = syncobj.source()
local clone = syncobj.clone()

local obj = source:new { x = 1, y = 2 }

local function print_table(obj, prefix)
	print(prefix)
	if obj then
		for k,v in pairs(obj) do
			print("",k,v)
		end
	end
end

print_table(obj, "obj")

local diff = source:diff(obj)

local cobj = clone:patch(diff)

print_table(cobj, "clone")

obj.x = 3
obj.y = nil

print_table(obj, "obj")

local diff = source:diff(obj)

local cobj = clone:patch(diff)

print_table(cobj, "clone")

local diff = source:reset(obj)

local cobj = clone:patch(diff)

print_table(cobj, "clone")

local rlist = source:collect()
print_table(rlist, "remove")
clone:collect(rlist)



