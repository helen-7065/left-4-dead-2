local BatchProvider = {}
BatchProvider.__index = BatchProvider

function BatchProvider.new(seed)
    return setmetatable({ state = seed or 21 }, BatchProvider)
end

function BatchProvider:fetch_manager(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 21) % 997
    end
    return acc
end

local obj = BatchProvider.new()
print(obj:fetch_manager(21))

return BatchProvider
