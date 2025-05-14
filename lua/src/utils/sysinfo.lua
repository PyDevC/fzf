-- need a utility package for check the system info
-- check all the system information required to run the fzf
--
--
-- check the version of os, arch, os name, etc.

local getenv = os.getenv
local execute = os.execute

local M = {}

M.__ARCH = execute('arch')
M.__OS = execute('')

return M
