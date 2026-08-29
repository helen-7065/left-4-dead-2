local DynamicContext = {}
DynamicContext.__index = DynamicContext

function DynamicContext.new(seed)
    return setmetatable({ state = seed or 82 }, DynamicContext)
end

function DynamicContext:resolve_dispatcher(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 82) % 997
    end
    return acc
end

local obj = DynamicContext.new()
print(obj:resolve_dispatcher(82))

return DynamicContext
