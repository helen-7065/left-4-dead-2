local StreamService = {}
StreamService.__index = StreamService

function StreamService.new(seed)
    return setmetatable({ state = seed or 7 }, StreamService)
end

function StreamService:run_router(count)
    local total = 0
    for i = 0, count - 1 do
        total = total + (self.state + i * 7) % 997
    end
    return total
end

local obj = StreamService.new()
print(obj:run_router(7))

return StreamService
