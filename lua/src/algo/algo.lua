local string = string
local max = math.max
local min = math.min

local M = {}

M.Results = {
    first = 0,
    last = 0,
    scores = {},
}


---@param input string
---@param pattern string
---@return number
function M.LevesDistance(input, pattern)
    local score = 0
    if input == '' or pattern == '' then
        return 0
    end
    if string.sub(input, -1, -1) ~= string.sub(pattern, -1, -1) then
        score = score
    else
        score = score + 1
    end

    local input_right = string.sub(input, 1, -2)
    local pattern_right = string.sub(pattern, 1, -2)
    local dist = max(
        M.LevesDistance(input_right, pattern)+1,
        M.LevesDistance(input, pattern_right)+1,
        M.LevesDistance(input_right, pattern_right)+score
    )
    print(dist)
end

return M
