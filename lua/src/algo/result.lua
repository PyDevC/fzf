local M = {}

M.Result = {} -- TODO: define a type for results

function M.Result:cache()
end

function M.indexResult(Result, score)
    -- when we get resulted scores we then assign index to the result so that 
    -- if the object is typed again we can readily use that cache to output the result faster
end
return M
