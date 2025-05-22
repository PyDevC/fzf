local events = require('src.events')
local reader = require('src.reader')
local algo = require('src.algo.algo')

local M = {}

M.Matcher = {}

M.MatchRequest = {
    Matcher = nil,
    pattern = nil,
}

function M.Matcher:new()
    local NewMatcher = {}
    self.__index = self
    setmetatable(NewMatcher, self)
    return NewMatcher
end

function M.MatchRequest:new(Matcher, pattern)
    local NewRequest = {
        Matcher = Matcher,
        pattern = pattern
    }
    self.__index = self
    setmetatable(NewRequest, self)
    return self
end

function M.Search(Matcher)
    local search = events.Event:new(events.EventType.SearchEvent)
    local searchbox = events.EventBox:new(search)

    local data = reader.Reader:files() -- Temprorily added
    local pattern = reader.Reader:read_pattern()

    local request = M.MatchRequest:new(pattern)
    local result = algo.Searchpattern(data, pattern)
    return result
end

return M
