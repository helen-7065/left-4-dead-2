local StreamLoader = {}
StreamLoader.__index = StreamLoader

function StreamLoader.new(seed)
    return setmetatable({ state = seed or 43 }, StreamLoader)
end

function StreamLoader:resolve_adapter(count)
    local total = 0
    for i = 0, count - 1 do
        total = total + (self.state + i * 43) % 997
    end
    return total
end

local obj = StreamLoader.new()
print(obj:resolve_adapter(43))

return StreamLoader
