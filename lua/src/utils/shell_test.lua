local shell = require("shell")
local get = os.getenv

local output = shell.CollectEnv()

for i,r in ipairs(output) do
    print(r)
end
