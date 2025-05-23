local read = io.read
local timeit = os.clock
local curses = require('curses')
local stirng = string

local M = {}

M.Reader = {
    delimiter = " ",
    token_in_time = 100, -- means 100ms
}

--reads each character at the rate of 100ms
function M.Reader:read_pattern()
    local start = 0
    local lap = 0
    local waitbefore = 0
    local waitafter = 0
    local wait = 0
    local pattern = ""
    local time = 0
    print("read pattern")

    curses.initscr()
    local stdscr = curses.stdscr()

    while true do
        waitbefore = timeit()
        print(waitbefore)

        local ch = stdscr:getch()

        waitafter = timeit()
        print(waitafter)

        wait = waitbefore + waitafter

        print(wait)
        if ch ~= -1 then
            pattern = pattern .. stirng.char(ch)
        end

        curses.napms(50) -- Sleep for a short while to reduce CPU usage

        lap = lap + wait + timeit()
        time = lap - start
        if time > 0.2 then
            curses.endwin()
            print(time)
            return pattern
        end
    end

    curses.endwin()
end

return M
