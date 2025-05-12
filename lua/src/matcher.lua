-- It contains the tables and functions that are used in matching the 
-- texts using a pattern. It uses algo.lua to run the fuzzy match request

local MatchRequest = {
    -- represents how the search request looks
    -- for now let use assume that we have same input for every request
    pattern,
    requestID,
    sort,
}

local Matcher = {
    cache -- contains the search results from the previous request preventing recomputation.
}

function NewMatcher()
    -- starts a new matcher in case the matcher in case a new match request is 
    -- signaled
end
