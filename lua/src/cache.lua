local M = {}

M.QueryCache = {}

M.QueryCacheChunks = {} -- divides querycache data into various categories for better lookups

function M.QueryCache:new()
end

function M.QueryCache:collect()
end

return M
