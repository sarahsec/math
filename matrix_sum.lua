local function sumMatrices(a, b)
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
