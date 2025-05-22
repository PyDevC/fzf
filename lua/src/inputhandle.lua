local utils = require('src.utils.sysinfo')
local string_byte = string.byte

local M = {}

M.delimiterChars = "/,:;|"

M.whiteChars = " \t\n\v\f\r\x85\xA0"

M.separator_byte = {
    dot = string_byte('.'),
    semi_colon = string_byte(';'),
    colon = string_byte(':'),
    fslash = string_byte('/'),
    bslash = string_byte('\\'),
    newline = string_byte('\n')
}

---@param input string
---@param sep string
---@return string
--Checks the separator to be used in input
--automatically check if the input is path or not
function M.separator(input, sep)
    sep = sep or get_separator(input)
    if type(sep) == "number" then
        sep = string.char(sep)
    end
    return sep
end

---@param input string
---@return integer
--Get numerical code of separator as a path or string
--default input (with path == false) = newline '\n'
local get_separator = function(input)
    if check_path(input) == true then
        if utils.__OS == 'Linux' then
            return M.separator_byte.fslash
        end
        return M.separator_byte.bslash
    elseif check_separator_end(input) and check_separator_front(input) then
        return M.separator_byte.fslash
    else
        return M.separator_byte.newline
    end
end

---@param input string
---@return boolean
---Check if the input is a path or not
function check_path(input)
    if check_separator_front(input) or check_separator_end(input) then
        return true
    end
    return false
end

function check_separator_front(input)
    local separ = { string_byte(input, 3), string_byte(input, 2) } -- TODO: also check for home/user/Desktop
    for _, s in ipairs(separ) do
        if s == M.separator_byte.bslash or s == M.separator_byte.fslash then
            return true
        end
    end
    return false
end

function check_separator_end(input)
    local separ = { string_byte(input, -3), string_byte(input, -2), string_byte(input, -1) } -- TODO: also check for home/user/Desktop
    for _, s in ipairs(separ) do
        if s == M.separator_byte.bslash or s == M.separator_byte.fslash then
            return true
        end
    end
    return false
end

return M
