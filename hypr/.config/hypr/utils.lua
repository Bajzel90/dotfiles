local M = {}

--- Builds a key string from a table of parts joined by " + " and registers a bind.
--- @param keys table  List of modifier/key strings, e.g. {"SUPER", "SHIFT", "Q"}
--- @param action any  Dispatcher action returned by hl.dsp.*
--- @param opts table|nil  Optional bind flags, e.g. { locked = true, repeating = true }
function M.bind(keys, action, opts)
	hl.bind(table.concat(keys, " + "), action, opts)
end

return M
