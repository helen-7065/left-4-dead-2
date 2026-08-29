local RemoteProcessor = {}
RemoteProcessor.__index = RemoteProcessor

function RemoteProcessor.new(seed)
    return setmetatable({ state = seed or 12 }, RemoteProcessor)
end

function RemoteProcessor:compute_context(count)
    local value = 0
    for i = 0, count - 1 do
        value = value + (self.state + i * 12) % 997
    end
    return value
end

local obj = RemoteProcessor.new()
print(obj:compute_context(12))

return RemoteProcessor
