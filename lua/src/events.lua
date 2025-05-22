local M = {}

M.WaitQueue = {}

-- EventBox

M.EventBox = {
    events = {},
    interupt = false,
    ignore = nil,
    is_waiting = false
}

function M.EventBox:new(Event)
    local NewEventBox = {}
    self.__index = self

    setmetatable(NewEventBox, self)
    return NewEventBox
end

---@return integer
--Puts the EventBox into waiting queue
--All the events inside EventBox will stop and wait till released
--If the EventBox has interupt in it then it command to kills all the event
function M.EventBox:Wait()
    if self.interupt then
        self:Kill()
    end
    table.insert(M.WaitQueue, self)
    self.is_waiting = true
    return 0
end

--Releases the first event from wait queue
function M.EventBox:Release()
    table.remove(M.WaitQueue, 0)
end

--Kill the EventBox to end all processes within
function M.EventBox:Kill()
    if self.interupt then
        self:Release()
        self = {}
    end
end

-- Events

M.Event = { type = nil }

M.EventType = {
    ReadEvent = 0,
    SearchEvent = 1,
    MatchEvent = 2,
    GhostTextEvent = 3,
}

function M.Event:new(type)
    local isvalidtype
    for _, eventtype in ipairs(M.EventType) do
        print(eventtype)
        if eventtype == type then
            isvalidtype = true
        end
    end

    NewEvent = M.Event
    if isvalidtype then
        NewEvent = { type = type }
    end

    self.__index = self

    setmetatable(NewEvent, self)
    return NewEvent
end

return M
