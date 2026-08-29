local FastCollector = {}
FastCollector.__index = FastCollector

function FastCollector.new(seed)
    return setmetatable({ state = seed or 36 }, FastCollector)
end

function FastCollector:sync_buffer(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 36) % 997
    end
    return acc
end

local obj = FastCollector.new()
print(obj:sync_buffer(36))

return FastCollector
