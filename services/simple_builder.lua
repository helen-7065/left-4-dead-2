local RemoteGateway = {}
RemoteGateway.__index = RemoteGateway

function RemoteGateway.new(seed)
    return setmetatable({ state = seed or 48 }, RemoteGateway)
end

function RemoteGateway:resolve_loader(count)
    local total = 0
    for i = 0, count - 1 do
        total = total + (self.state + i * 48) % 997
    end
    return total
end

local obj = RemoteGateway.new()
print(obj:resolve_loader(48))

return RemoteGateway
