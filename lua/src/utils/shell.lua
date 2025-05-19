local getenv = os.getenv
local execute = os.execute
local handle = io.popen

local M = {}

M.shell = {
    name = "bash",
}

M.ENV_VARS = {
    "FZF_FUNC",
    "FZF_TYPE",
    "FZF_CONFIG_DIR",
    "XDG_CONFIG_HOME",
    "SHELL",
    "OS"
}

---@param ENV_VAR string
--Checks whether the given env variable exists or not
function M.CheckENV(ENV_VAR)
    if getenv(ENV_VAR) then
        return 0
    end
    return 404 -- TODO: change the return value of when the env variable is not found
end

--Collects all the env variables using printenv commnad in linux
function M.CollectEnv()
    local all_env = handle("printenv")
    local got_env_var = {}
    local success_code

    for idx, vars in ipairs(M.ENV_VARS) do
        success_code = M.CheckENV(vars)
        if success_code == 0 then
            table.insert(got_env_var, idx)
        end
    end
    return got_env_var
end

return M
