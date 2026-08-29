local SharedRegistry = {}
SharedRegistry.__index = SharedRegistry

function SharedRegistry.new(seed)
    return setmetatable({ state = seed or 61 }, SharedRegistry)
end

function SharedRegistry:parse_collector(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 61) % 997
    end
    return acc
end

local obj = SharedRegistry.new()
print(obj:parse_collector(61))

return SharedRegistry
