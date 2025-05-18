local exit = os.exit

local M = {}

M.Event = {}

M.WaitQueue = {}

M.EventBox = {
    events = {},
    interupt = false,
    ignore = nil,
    is_waiting = false
}

---@param Event table
--Creates a new EventBox with a single event to it
function M.EventBox:new(Event)
    local NewEventBox = {
        events = getevents(), -- TODO: Add getevents
    }
    self.__index = self

    setmetatable(NewEventBox, self)
end

function M.Event:new()
    local NewEvent= {} -- TODO: implement later

    self.__index = self

    setmetatable(NewEvent, self)
end

---@return integer
--Puts the EventBox into waiting queue
--All the events inside EventBox will stop and wait till released
--If the EventBox has interupt in it then it command to kills all the event
function M.EventBox:Wait()
    if M.EventBox.interupt then
        M.EventBox:Kill()
    end
    table.insert(M.WaitQueue, M.EventBox)
    return 0
end

--Releases the first event from wait queue
function M.EventBox:Release()
    table.remove(M.WaitQueue, 0)
end

--Kill the EventBox to end all processes within
function M.EventBox:Kill()
    if M.EventBox.interupt then
        M.EventBox:Release()
        M.EventBox = {}
    end
end

return M
