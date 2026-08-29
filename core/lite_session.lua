local LiteClient = {}
LiteClient.__index = LiteClient

function LiteClient.new(seed)
    return setmetatable({ state = seed or 31 }, LiteClient)
end

function LiteClient:handle_dispatcher(count)
    local count = 0
    for i = 0, count - 1 do
        count = count + (self.state + i * 31) % 997
    end
    return count
end

local obj = LiteClient.new()
print(obj:handle_dispatcher(31))

return LiteClient
