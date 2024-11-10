Julia has various mathematical and bitwise operations defined on all numeric primitive types. If you have some background in other programming languages, like JavaScript or Python, you may be familiar with most of these operators, but Julia offers few curious operators which I find very interesting and useful. 

## Arithmetic Operators:

In below table I first list the arithmetic operators in Julia which I copy directly from the Julia's documentation website, but I will provide examples or comparisons when necessary. 

|Expression|Name|Description|
|----------|----|-----------|
|`+x`|unary plus|the identity operation|
|`-x`|unary minus|maps values to their additive inverse|
|`x + y`|binary plus|performs addition|
|`x - y`|binary minus|performs subtraction|
|`x * y`|times|performs multiplication|
|`x / y`|divide|performs division|
|`x ÷ y`|integer divide|`x / y`, truncated to an integer|
|`x \ y`|inverse divide|equivalent to `y / x`|
|`x ^ y`|power|raises `x` to the `y`th power|
|`x % y`|remainder|equivalent to `rem(x, y)`|

**Note 1:** The divide and integer divide operators (`/` and `÷`) both perform division but the output or result of `/` is a floating-point number, but the result of `÷` is an integer. Example:

```julia
# Divide:
5 / 2 # Output: 2.5

# Integer Divide:
5 ÷ 2 # Output: 2
```

How to write `÷` in Julia? For this we use as always the LaTex format of the symbol which is `\div`+`tab`. 

The `÷` (integer divide) operator is like the `\\` operator in Python and both languages output the quotient of the division. 

**Note 2**: The inverse divide in Julia (`\`) is very important and interesting. In Python there is no equivalent for this operator and it is unique to this programming language. In Python if you need the inverse division you have to use third-party packages like NumPy. In R, however, we have a inverse division operator with this form: `%*%`. 

The inverse division operator is very useful when we try to do matrix algebra and solving linear equations. Example:

```
A = [4 3; 2 1]
b = [5, 6]

x = A \ b # Solves for x in Ax = b.

println(x) # Output: [6.5, -7.0]
```

In the above example, we defined a matrix and called it `A` and then used the inverse divide operator to calculate the `x` in $Ax = b$ equation. The use of inverse operations, including inverse division, reinforces the mathematical concept of inverse. 

In my opinion, this helps the code and the mathematical equations to be as similar as possible, and I believe this could make the mathematics of the problem we are solving and its code representation more coherent and consistent.

**Note 3:** In Julia placing a numeric literal directly before the identifier or variable names, is treated as a multiplication. For example: `2x` or `2(x + 1)` is considered as a multiplication of `2` and `x` or multiplication of `2` and `(x + 1)`. 

In Julia, by convention, we tend to space operators more tightly if they get applied before other nearby operators. For example we often write `-x + 2`. This means first the x gets negated then we add two to the value of that negation.

**Note 4:** The boolean types `true` and `false` are in fact a integer type in Julia programming language. This means all the arithmetic operations can be defined on these types. For instance we can have this operation: 

```julia
1 + false # Output: 1
1 + true # Output: 2
false + true # Output: 1
false * true # Output: false
```

The important thing to note here is that if we use false in multiplication, `false` will be treated as strong zero. For example:

```julia
NaN * false # Output: 0.0
Inf * false # Output: 0.0
```

This is very important for preventing the propagation of `NaN` values in quantities that are know to be zero. For more information visit this article: [Knuth (1992)](https://arxiv.org/abs/math/9205211)

## Boolean Operators
The following operators are defined in Julia on `Bool` type. I directly copy the types from the documentation for the sake of completeness:

<table>
  <tr>
    <th>Expression</th>
    <th>Name</th>
  </tr>
  <tr>
    <td><code>!x</code></td>
    <td>negation</td>
  </tr>
  <tr>
    <td><code>x && y</code></td>
    <td>short-circuiting and</td>
  </tr>
  <tr>
    <td><code>x || y</code></td>
    <td>short-circuiting or</td>
  </tr>
</table>

**What are short-circuiting and, and short-circuiting or**: 
The operators `&&` and `||` correspond to logical operators `AND` and `OR`. These operators have a very important feature, called short-circuiting evaluation. In a series of boolean expressions, they don't evaluate their second argument. Short-circuiting behaviors is very similar to conditional evaluation inf `if-elseif-else` expression. Here only minimum number of expressions are evaluated as are necessary to determine the final boolean value of the entire chain. This means:

* In the expression `a && b`, the subexpression `b` is only evaluated if `a` evaluates to `true`.
* In the expression `a || b`, the subexpression `b` is only evaluated if `a` evaluates to `false`. 

This is very important in tasks where evaluating each expression is costly. Therefore, it is wise to place the expression whose evaluation cost is relatively minimum first in the expression chain. In this way, the performance of the code with complicated arguments increases because we first evaluate an argument that can determine the entire output of the expression chain.

The reasoning is that `a && b` must be `false` if `a` is `false`, therefore there is no need to check whether `b` is `false` or `true`. And for the short-circuiting or, the expression `a || b` must be true if `a` is `true`, therefore, there is no need to check the state of the `b` when `a` is `true`. Hope that makes sense. 

## Bitwise operations:
The bitwise operations are fundamental techniques which we can use to manipulate the binary representations of the values. This is very important in low-level programming and in tasks where we are dealing with data processing and optimization, bitwise operations play an important role. 

The bitwise operations are directly performed to the binary representation of the values, in each bit of the representation. This means we manipulate the value bit by bit, and hence the name bitwise operations. 

The goal of bitwise operations is to enable us to manipulate and control the data directly which ultimately makes the code to behave more efficiently and optimally. 

For example consider bitwise `NOT`. 

```
NOT 0111 => 1000 
```
The `0111` is binary representation of the number 7, first bit has the value 0, therefore, `NOT 0` will be `1`. Second, third and forth bits are all `1` and therefore `NOT 1` for each of these bits will be `0`. The final binary is `1000` which is the binary representation of the number 8. Therefore, the bitwise `NOT` of the number 7 is number 8. 

In the table below I introduce the bitwise operations in Julia directly from the documentation, and as before I add examples and descriptions wherever needed. 

|Expression|Name|
|----------|----|
|`~x`|bitwise not|
|`x & y`|bitwise and|
|`x \| y`|bitwise or*|
|`x ⊻ y`|bitwise xor (exclusive or)|
|`x ⊼ y`|bitwise nand (not and)|
|`x ⊽ y`|bitwise nor (not or)|
|`x >>> y`|logical shift right|
|`x >> y`|arithmetic shift right|
|`x << y`|logical/arithmetic shift left|

*The bitwise or is written like `x | y`, the \ sign in front of the `|` is escape sequence for markdown format of the table. Therefore in the code we write `x | y` as the bitwise or. 

#### Applications and some of the use cases of bitwise operations:
 In many applications, especially those involving user authentication, bitwise operations can be used to manage user permissions efficiently. Each permission can be represented as a single bit in an integer. For example: 

Defining permissions:
* Read: 4 (100)
* Write: 2(010)
* Execute: 1 (001)

```
permissions = Read | Write  # This gives you 110 (3) which is read and write
```

**Examples**:

**Bitwise XOR (x ⊻ y):**
Sets each bit to 1 if only one of the corresponding bits is 1 (exclusive OR):
```
 x:   00000110  (6 in decimal)
 y:   00000011  (3 in decimal)
 x ⊻ y: 00000101  (5 in decimal)
```

**Bitwise NAND (x ⊼ y):**
First performs an AND operation, then inverts each bit:

```
 x:   00000110  (6 in decimal)
 y:   00000011  (3 in decimal)
 x & y: 00000010  (2 in decimal)
 x ⊼ y: 11111101  (-3 in decimal)
```

**Bitwise NOR (x ⊽ y):**
First performs an OR operation, then inverts each bit:
```
 x:   00000110  (6 in decimal)
 y:   00000011  (3 in decimal)
 x | y: 00000111  (7 in decimal)
 x ⊽ y: 11111000  (-8 in decimal)
```

**Logical Shift Right (x >>> y):**
Shifts bits to the right and fills leftmost bits with 0s. Logical shift is used primarily for unsigned numbers:

```
 x:        00001100  (12 in decimal)
 x >>> 2:  00000011  (3 in decimal)
```

**Arithmetic Shift Right (x >> y):**
Shifts bits to the right, keeping the sign bit (leftmost bit) the same, which preserves the sign in signed integers.
```
 x:        11110100  (-12 in decimal)
 x >> 2:   11111101  (-3 in decimal)
```

**Logical/Arithmetic Shift Left (x << y):**
Shifts bits to the left and fills rightmost bits with 0s. Both logical and arithmetic shifts left work the same way in most implementations:

```
 x:        00000011  (3 in decimal)
 x << 2:   00001100  (12 in decimal)
```

### Resources:

[Julia's Documentation](https://docs.julialang.org/en/v1/manual/mathematical-operations/)

[Short-Circuiting](https://docs.julialang.org/en/v1/manual/control-flow/#man-conditional-evaluation)

[Bitwise operations](https://en.wikipedia.org/wiki/Bitwise_operation)