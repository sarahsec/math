local function sameShape(a, b)
    if type(a) ~= "table" or type(b) ~= "table" or #a == 0 then
        return false
    end
    if type(a[1]) ~= "table" or #a[1] == 0 then
        return false
    end
    if #a ~= #b then
        return false
    end
    local cols = #a[1]
    for i = 1, #a do
        if type(a[i]) ~= "table" or type(b[i]) ~= "table" then
            return false
        end
        if #a[i] ~= cols or #b[i] ~= cols then
            return false
        end
    end
    return true
end

local function sumMatrices(a, b)
    if not sameShape(a, b) then
        error("matrices must be non-empty and the same size", 2)
    end
    local rows = #a
    local cols = #a[1]
    local result = {}
    for i = 1, rows do
        result[i] = {}
        for j = 1, cols do
            result[i][j] = a[i][j] + b[i][j]
        end
    end
    return result
end

local function printMatrix(m)
    for i = 1, #m do
        local row = {}
        for j = 1, #m[i] do
            row[#row + 1] = string.format("%6.2f", m[i][j])
        end
        print(table.concat(row, " "))
    end
end

local M = {
    sameShape = sameShape,
    sumMatrices = sumMatrices,
}

if arg and arg[0] and tostring(arg[0]):find("matrix_sum", 1, true) then
    local matrixA = {
        {1, 2, 3},
        {4, 5, 6},
        {7, 8, 9}
    }

    local matrixB = {
        {9, 8, 7},
        {6, 5, 4},
        {3, 2, 1}
    }

    local matrixC = sumMatrices(matrixA, matrixB)

    print("Matrix A")
    printMatrix(matrixA)
    print("")
    print("Matrix B")
    printMatrix(matrixB)
    print("")
    print("A + B")
    printMatrix(matrixC)
end

return M
