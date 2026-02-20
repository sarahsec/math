local width = 80
local height = 30
local maxIter = 40
local xMin, xMax = -2.2, 1.0
local yMin, yMax = -1.2, 1.2
local palette = " .:-=+*#%@"

for py = 1, height do
    local y0 = yMin + (py - 1) * (yMax - yMin) / (height - 1)
    local line = {}
    for px = 1, width do
        local x0 = xMin + (px - 1) * (xMax - xMin) / (width - 1)
        local x, y = 0, 0
        local iter = 0
        while x * x + y * y <= 4 and iter < maxIter do
            local xt = x * x - y * y + x0
            y = 2 * x * y + y0
            x = xt
            iter = iter + 1
        end
        local idx = math.floor(iter / maxIter * (#palette - 1)) + 1
        if iter == maxIter then
            idx = #palette
        end
        line[#line + 1] = palette:sub(idx, idx)
    end
    print(table.concat(line))
end
