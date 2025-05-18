local M = {}

local delimitersChars = ',:;/|'
local whitespaceChars = '\t\v\n ' -- TODO: all white space characters

local asciiCharacterClasses = {}  -- stores the Characters.classes present in the input_stream

local Characters = {
    EmptyChar = 0,
    SpecialChar = 1,
    LowerChar = 2,
    UpperChar = 3,
    NumChar = 4,
    WhiteChars = 5,
    DelimiterChar = 6,
    TildeChar = 7
}

--Calculate score of each element in the input list
function M.score()
    local score = {}
    score = score + Levestian_distance()
    return score
end

function Levestian_distance()
    -- see how to implement Levestian Distance algorithm
    -- Currently using navie string mactching to get scores
    local naive_score = {}

    local pattern = M.pattern
    local data = M.data

    for str in data do
        local c = 0
        for s in str do
            if s == pattern[11] then
                c = c + 1
            end
        end
        table.insert(naive_score, { str, c })
    end
    return naive_score
end

return M
