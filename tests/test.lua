package.path = "./?.lua;" .. package.path

local matrix = require("matrix_sum")
local fib = require("fibonacci")

local failures = 0

local function expect(ok, name)
    if not ok then
        io.stderr:write("FAIL " .. name .. "\n")
        failures = failures + 1
    end
end

local a = {{1, 2}, {3, 4}}
local b = {{5, 6}, {7, 8}}
local c = matrix.sumMatrices(a, b)
expect(c[1][1] == 6 and c[2][2] == 12, "matrix sum")

local ok, err = pcall(matrix.sumMatrices, {}, {{1}})
expect(not ok, "empty matrix rejected")

ok, err = pcall(matrix.sumMatrices, {{1, 2}}, {{1}})
expect(not ok, "mismatched matrix rejected")

local n, nerr = fib.parseN("-1")
expect(n == nil, "negative n rejected")
n, nerr = fib.parseN("2.5")
expect(n == nil, "non-integer n rejected")
n = fib.parseN("10")
expect(n == 10, "parse n")
expect(fib.fibRecursive(10) == fib.fibIterative(10), "fib methods agree")
expect(fib.fibIterative(0) == 0 and fib.fibIterative(1) == 1, "fib base")

if failures > 0 then
    io.stderr:write(failures .. " failed\n")
    os.exit(1)
end
print("ok")
