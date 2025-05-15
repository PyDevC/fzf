local M = {}

M.Event = {
    EventType = 0,
}

M.EventBox = {
    events = nil,         -- can be one or more events
    interupt = false, -- if an event if active in the event box that could interupt all processes
    ignore = nil
}

---@param EventBox table
---@param Event table
--Creates a new EventBox with a single event to it
function NewEventBox(EventBox, Event)
    EventBox.events = { Event.Event }
end

function Wait(Event)
end

function Kill(Event)
end

return M
