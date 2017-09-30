local skynet = require "skynet"

skynet.start(function()
	local service2 = skynet.newservice("service2")
	skynet.call(service2, "lua", "set", "key1", "value1")	
	local value = skynet.call(service2, "lua", "get", "key1")
	skynet.error("call get res", value)
	skynet.exit()
end)