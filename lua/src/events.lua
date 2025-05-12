-- handles the events such as
-- signals the canceling of event
-- waits for eveents to occur
--
-- simply don't know how to read those in lua
-- probably need an external library
-- Basic strcture of what events.lua should look like

-- Even the things mentioned here are all tables and functions, they will be changed in future according to the needs

local EventHandler = {
    -- functions:
    -- sync events
    -- add events to event box
    -- set the priority of the event
    -- execute multiple events in parallel
}

local EventHandlerProperties = {
    -- contains properties that you want to have in your event handler
    -- this makes sure that we can customize the events that has to be read
}

local EventQueue = {
    -- contains the priority queue to execute the events 
    -- Controllled by EventBox
}

function EventRequest()
    -- Signals other processes to start a new process
end

local event = {}
local LoadedEvents = {}

function EventBox()
    -- provide events when requested
    -- provide the id of events and priority
    -- delete the event when executed
    -- or if the event is terminated by other events
    -- can intrupt other event and start new event
end

function wait()
    -- wait for the events to occur
    -- just waits for event to occur sits idle most of the time
end

function kill(eid)
    -- kills the process based on the event ID
end
