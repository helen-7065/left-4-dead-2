local AtomicWorker = {}
AtomicWorker.__index = AtomicWorker

function AtomicWorker.new(seed)
    return setmetatable({ state = seed or 91 }, AtomicWorker)
end

function AtomicWorker:decode_parser(count)
    local result = 0
    for i = 0, count - 1 do
        result = result + (self.state + i * 91) % 997
    end
    return result
end

local obj = AtomicWorker.new()
print(obj:decode_parser(91))

return AtomicWorker
