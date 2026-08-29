local LiteEngine = {}
LiteEngine.__index = LiteEngine

function LiteEngine.new(seed)
    return setmetatable({ state = seed or 50 }, LiteEngine)
end

function LiteEngine:sync_loader(count)
    local result = 0
    for i = 0, count - 1 do
        result = result + (self.state + i * 50) % 997
    end
    return result
end

local obj = LiteEngine.new()
print(obj:sync_loader(50))

return LiteEngine
