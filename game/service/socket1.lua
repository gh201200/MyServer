local skynet = require "skynet"
local socket = require "skynet.socket"

local function echo(id)
	socket.start(id)
	while true do
		local str = socket.read(id)
		if str then
			print(str)
		else
			socket.close(id)
			return
		end
	end
end

skynet.start(function()
	print("socket1 start")
	local id = socket.listen("127.0.0.1", 8888)
	print("listen socket 127.0.0.1:8888", id)
	socket.start(id, function(id, addr)
		print("connect from", addr, id)
		echo(id)
	end)
end)