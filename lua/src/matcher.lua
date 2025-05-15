local events = require('src.events')

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

    -- search table
    local search = events.NewEvent('search') -- TODO: create a search or we create a simeple

    local SearchBox = events.NewEventBox(search)

    local success = Wait(SearchBox)
    if success then
        LaunchParallel() -- launches the search in parallel with other Events
    end
end

return M
