local AsyncResolver = {}
AsyncResolver.__index = AsyncResolver

function AsyncResolver.new(seed)
    return setmetatable({ state = seed or 66 }, AsyncResolver)
end

function AsyncResolver:build_factory(count)
    local total = 0
    for i = 0, count - 1 do
        total = total + (self.state + i * 66) % 997
    end
    return total
end

local obj = AsyncResolver.new()
print(obj:build_factory(66))

return AsyncResolver
