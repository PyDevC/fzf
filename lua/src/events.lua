local exit = os.exit

local M = {}

M.Event = {
    EventType = 0,
}

M.WaitQueue = {} -- in executor check whether the event box is in wait or not

M.EventBox = {
    events = nil,     -- can be one or more events
    interupt = false, -- if an event if active in the event box that could interupt all processes
    ignore = nil
}

---@param Event table
---@return table
--Creates a new EventBox with a single event to it
function M.NewEventBox(Event)
    local EventBox = M.EventBox
    EventBox.events = { Event.Event }
    return EventBox
end

---@return table
function M.NewEvent()
    local Event = M.Event
    return Event
end

---@param EventBox table
---@return integer
--Puts the EventBox into waiting queue
--All the events inside EventBox will stop and wait till released
--If the EventBox has interupt in it then it command to kills all the event
function M.Wait(EventBox)
    if EventBox.interupt then
        Kill(EventBox)
    end
    table.insert(M.WaitQueue, EventBox)
    return 0
end

--Releases the first event from wait queue
function M.Release()
    table.remove(M.WaitQueue, 0)
end

function M.Kill(EventBox)
    if EventBox.interupt then
        EventBox = nil
        M.WaitQueue = nil
        exit(1)
    end
end

return M
