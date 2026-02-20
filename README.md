# Lua College Assignment

This project contains three small Lua programs that connect math concepts to practical programming.

## 1) Visual Math and Fractals: Simplified Mandelbrot Set
- File: `mandelbrot.lua`
- What it does: prints an ASCII visualization of a simplified Mandelbrot set in the terminal.
- Core idea: each character position is mapped to a complex number, and iterative divergence determines the symbol intensity.

Run:
```bash
lua mandelbrot.lua
```

## 2) Algebra and Matrices: Matrix Addition
- File: `matrix_sum.lua`
- What it does: adds two 3x3 matrices and prints the original matrices and the result.
- Core idea: element-wise addition using nested loops and table indexing.

Run:
```bash
lua matrix_sum.lua
```

## 3) Fibonacci Sequence
- File: `fibonacci.lua`
- What it does: computes Fibonacci in two ways (recursive and iterative), then compares call count and execution time.
- Core idea: recursion demonstrates exponential growth in repeated work, while iteration demonstrates a more efficient linear approach.

Run:
```bash
lua fibonacci.lua
lua fibonacci.lua 40
```

## Learning Outcomes
- Understand how iterative formulas create fractal structures.
- Apply matrix addition from linear algebra in code.
- Compare recursive and iterative algorithm behavior in Fibonacci.
- Observe how implementation choice impacts performance.
