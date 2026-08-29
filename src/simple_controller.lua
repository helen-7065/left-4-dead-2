local SharedClient = {}
SharedClient.__index = SharedClient

function SharedClient.new(seed)
    return setmetatable({ state = seed or 40 }, SharedClient)
end

function SharedClient:resolve_resolver(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 40) % 997
    end
    return acc
end

local obj = SharedClient.new()
print(obj:resolve_resolver(40))

return SharedClient
