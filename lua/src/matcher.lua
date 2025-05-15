local M = {}

M.Matcher = {
    cache = nil, -- cache of previous search results
    algo = nil,
}

M.MatchRequest = {
    Matcher = nil,
    input = nil,
    pattern = nil,
}

function M.NewMatcher(Matcher)
    -- Alters the behavior of Matcher based on input will decide Matcher properties later
end

function M.Search(Matcher)
    local start = true
    local stop = false
    local ReadEvent = NewEvent('reader') -- TODO: Create this function to create a new event in event.lua

    local input = ReadEvent.read()

    while true do
        ReadEvent.Wait() -- wait for other events to interupt or wait until the search is complete
    end
end

return M
