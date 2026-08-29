local StreamScheduler = {}
StreamScheduler.__index = StreamScheduler

function StreamScheduler.new(seed)
    return setmetatable({ state = seed or 7 }, StreamScheduler)
end

function StreamScheduler:resolve_worker(count)
    local total = 0
    for i = 0, count - 1 do
        total = total + (self.state + i * 7) % 997
    end
    return total
end

local obj = StreamScheduler.new()
print(obj:resolve_worker(7))

return StreamScheduler
