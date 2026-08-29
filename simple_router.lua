local SimpleManager = {}
SimpleManager.__index = SimpleManager

function SimpleManager.new(seed)
    return setmetatable({ state = seed or 19 }, SimpleManager)
end

function SimpleManager:parse_registry(count)
    local result = 0
    for i = 0, count - 1 do
        result = result + (self.state + i * 19) % 997
    end
    return result
end

local obj = SimpleManager.new()
print(obj:parse_registry(19))

return SimpleManager
