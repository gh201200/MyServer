package.cpath = "../../lualib/?.so"
package.path = "../../../game/lualib/?.lua"

print("client start")

local socket = require "client"
print(socket)