local getenv = os.getenv
local exec = os.execute

local M = {}

M.Executor = {
    SHELL = nil,
    ESC = nil,
}

---@param Executor table
--Creates a new executor and adds SHELL and ESC to it
function M.NewExecutor(Executor)
    Executor.SHELL = getenv('SHELL')
    Executor.ESC = '/'
end

---@param Executor table
---@param shell string
--Perform commands to your new shell
--shell should be path to executable file of shell file liek /usr/bin/zsh
function M.setNewShell(Executor, shell)
    Executor.SHELL = shell
end

function M.execute(Executor, request)
    exec()
end

function M.Read(Executor)
    -- get user input using shell integration
end

return M
