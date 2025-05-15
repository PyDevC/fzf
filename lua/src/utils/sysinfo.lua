-- need a utility package for check the system info
-- check all the system information required to run the fzf
--
--
-- check the version of os, arch, os name, etc.

local arch = jit.arch
local os = jit.os

local M = {}

M.__ARCH = arch
M.__OS = os

return M
