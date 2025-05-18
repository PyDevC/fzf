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

function M.Matcher:new(algo, keep_cache)
    keep_cache = keep_cache or true

    if keep_cache then
        cache = getcache() -- TODO: get cache from previous searches
    end
    local NewMatcher = {
        algo = algo,
        cache = cache or nil
    }

    self.__index = self

    setmetatable(NewMatcher, self)
end

--Starts search request for the input data
function M.Search(Matcher)
    local start = true
    local stop = false

    local request = Matcher
    local search = events.Event:new()
    local searchbox = events.EventBox:new(search)

    if #events.WaitQueue then
        events.Wait(searchbox) -- only wait if other processes are running
    end


    -- Started search query here
    -- if a search query doesn't give result then handle that
    -- also even if the matching was not complete, the result should be returned and cached
end

return M
