local read = io.read

local M = {}

M.Reader = {
    delimiter = " ",
    token_in_time = 100, -- means 100ms
}

--reads each character at the rate of 100ms
function M.Reader:read_pattern()
    local start = 0
    local lap = 0
    local pattern = ""
    print("read pattern")
    while true do
        local time = lap - start
        local input = read(1)
        pattern = pattern .. input
        -- check if input contains any interupts
        if time == 2 then
            -- pass this whole input to new matcher
            start = 0
            return pattern
        end
        lap = lap + 1
    end
end

function M.Reader:files()
    local filepath = read() -- reads file from terminal this will be later changed when we develop cli
    local file = read(10)
    return file
end

function M.Reader:stdin()
end

function M.Reader:API()
end

return M
