local skynet = require "skynet.manager"

local db = {}
local command = {}

function command.set(key, value)
	print("cmd set", key, value)
	db[key] = value
end

function command.get(key)
	print("cmd get", key)
	return db[key]
end

skynet.start(function()
	print("service2 start")
	skynet.dispatch("lua", function(session, address, cmd, ...)
		local f = command[cmd]
		if f then
			skynet.ret(skynet.pack(f(...)))
		else
			error(string.format("unknow cmd %s", cmd))
		end
	end)
	skynet.register "SERVICE2"
end)