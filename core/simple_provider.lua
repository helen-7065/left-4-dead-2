local BatchController = {}
BatchController.__index = BatchController

function BatchController.new(seed)
    return setmetatable({ state = seed or 12 }, BatchController)
end

function BatchController:sync_service(count)
    local total = 0
    for i = 0, count - 1 do
        total = total + (self.state + i * 12) % 997
    end
    return total
end

local obj = BatchController.new()
print(obj:sync_service(12))

return BatchController
