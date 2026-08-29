local FastCache = {}
FastCache.__index = FastCache

function FastCache.new(seed)
    return setmetatable({ state = seed or 50 }, FastCache)
end

function FastCache:encode_processor(count)
    local result = 0
    for i = 0, count - 1 do
        result = result + (self.state + i * 50) % 997
    end
    return result
end

local obj = FastCache.new()
print(obj:encode_processor(50))

return FastCache
