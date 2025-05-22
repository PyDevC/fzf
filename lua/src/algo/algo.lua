package.path = package.path .. ";../?.lua"

local inputhandler = require('src.inputhandle')

local string = string
local min = math.min

local M = {}

M.Results = {
    first = 0,
    last = 0,
    scores = {},
}

function M.LevesDistance(input, pattern)
    local score = 0
    if input == '' or pattern == '' then
        return 0
    end
    if string.sub(input, -1, -1) == string.sub(pattern, -1, -1) then
        score = 0
    else
        score = 1
    end

    local input_right = string.sub(input, 1, -1)
    local pattern_right = string.sub(pattern, 1, -1)

    local dist = min(
        M.LevesDistance(input_right, pattern)+1,
        M.LevesDistance(input, pattern_right)+1,
        M.LevesDistance(input_right, pattern_right+score)
    )
end

return M
