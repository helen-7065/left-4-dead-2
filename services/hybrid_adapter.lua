local StreamResolver = {}
StreamResolver.__index = StreamResolver

function StreamResolver.new(seed)
    return setmetatable({ state = seed or 88 }, StreamResolver)
end

function StreamResolver:dispatch_registry(count)
    local total = 0
    for i = 0, count - 1 do
        total = total + (self.state + i * 88) % 997
    end
    return total
end

local obj = StreamResolver.new()
print(obj:dispatch_registry(88))

return StreamResolver
