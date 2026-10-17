local recursiveCalls = 0

local function parseN(raw)
    local n = tonumber(raw)
    if n == nil then
        return nil, "n must be a number"
    end
    if n ~= math.floor(n) or n < 0 then
        return nil, "n must be a non-negative integer"
    end
    return n
end

local function fibRecursive(n)
    recursiveCalls = recursiveCalls + 1
    if n <= 1 then
        return n
    end
    return fibRecursive(n - 1) + fibRecursive(n - 2)
end

local function fibIterative(n)
    if n <= 1 then
        return n
    end
    local a, b = 0, 1
    for _ = 2, n do
        a, b = b, a + b
    end
    return b
end

local M = {
    parseN = parseN,
    fibRecursive = fibRecursive,
    fibIterative = fibIterative,
}

if arg and arg[0] and tostring(arg[0]):find("fibonacci", 1, true) then
    local n, err = parseN(arg[1] or "30")
    if not n then
        io.stderr:write(err .. "\n")
        os.exit(1)
    end

    recursiveCalls = 0
    local t1 = os.clock()
    local r1 = fibRecursive(n)
    local recursiveTime = os.clock() - t1

    local t2 = os.clock()
    local r2 = fibIterative(n)
    local iterativeTime = os.clock() - t2

    print("n =", n)
    print("Recursive Fibonacci:", r1)
    print("Recursive calls:", recursiveCalls)
    print(string.format("Recursive time: %.6f seconds", recursiveTime))
    print("Iterative Fibonacci:", r2)
    print(string.format("Iterative time: %.6f seconds", iterativeTime))
    print(string.format("Speedup: %.2fx", recursiveTime / math.max(iterativeTime, 1e-9)))
end

return M
