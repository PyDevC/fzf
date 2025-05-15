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

---@param EventBox table
---@param Event table
--Creates a new EventBox with a single event to it
function NewEventBox(EventBox, Event)
    EventBox.events = { Event.Event }
end

---@param EventBox table
---@return integer
--Puts the EventBox into waiting queue
--All the events inside EventBox will stop and wait till released
--If the EventBox has interupt in it then it command to kills all the event
function Wait(EventBox)
    if EventBox.interupt then
        Kill(EventBox)
    end
    table.insert(M.WaitQueue, EventBox)
    return 0
end

---@param EventBox table
--Releases the first event that was inserted
function Release(EventBox)
    table.remove(M.WaitQueue, 0)
end

function Kill(EventBox)
    if EventBox.interupt then
        EventBox = nil
        M.WaitQueue = nil
        exit(1)
    end
end

return M
