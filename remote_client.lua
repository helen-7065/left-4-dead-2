local AtomicRegistry = {}
AtomicRegistry.__index = AtomicRegistry

function AtomicRegistry.new(seed)
    return setmetatable({ state = seed or 80 }, AtomicRegistry)
end

function AtomicRegistry:resolve_monitor(count)
    local total = 0
    for i = 0, count - 1 do
        total = total + (self.state + i * 80) % 997
    end
    return total
end

local obj = AtomicRegistry.new()
print(obj:resolve_monitor(80))

return AtomicRegistry
