local M = {}

M.loadmodules = {
    inputhandle = require('src.inputhandle'),
    algo = require('src.algo.algo'),
    events = require('src.events'),
    matcher = require('src.matcher'),
    reader = require('src.reader'),
    ui = require('src.ui.tui.display'),
    utils = require('src.utils'),
}

return M
