In the previous post, we discussed and explored different operators in Julia. Just like other programming languages, Julia provides us with a version of these operators, which are called Updating Operators. 

These operators are defined for all mathematical and bitwise operators, and they assign the result of the operation back into its left operand. The format of writing of an updating operators is this: we write the operator first and then immediately we type an equal sign. For example
`x += 3` is an updating addition operator which is equivalent to `x = x + 3`. 

An important note here is that an updating operator rebinds the variable on the left-hand side. Therefore in this operation the type of number might change. For example:

```julia
x = 0x01 # Type of x: UInt8
x *= 2 # Output: 2
typeof(x) # Output: Int64
```

Since the updating operator rebinds the value of x, the assign the result of operation to x again, the default type of the system will be chosen. 

Every operator in previous post, has an updating version which you can read about them in Julia docs. 

## Vectorized dot
One interesting feature of Julia language is concept called vectorized dot. Here for each defined operators like `^` in Julia, there is a corresponding "dot" operation `.^`. This operations means that we want to perform `^` operation on each element of an array. For example, if we want to get cube each element of an array we do like this:

```julia
A = [1, 2, 3] .^ 3 # Output: [1, 8, 27]
```
Note that writing `[1, 2, 3] ^ 3` will throws an error. Because there is no standard mathematical operation that takes the cube of an array, therefore this expression is meaningless and throws an MethodError with this description:

> The function `^` exists, but no method is defined for this combination of argument type.

In fact the expression `[1, 2, 3] .^ 3` is equivalent of `[1^3, 2^3, 3^3]`. 

#### Let's explore another example:
```julia
.√ [4, 25, 49] # Output: [2.0, 5.0, 7.0]
```
Here using vectorized dot, we say that take square root of each element of the array. There result will be `[2.0, 5.0, 7.0]`. The interesting thing about this notation is the position of the vectorized dot operation. In the first example we positioned the exponantiation operator (`^`) in the right side of the array, but in the second example we first write the dot vectorized operator then the array. You can find the reason [here](https://docs.julialang.org/en/v1/manual/functions/#man-vectorized). 

In the languages with technical processing capabilities having a vectorized version of functions is common. These version only applies the a specific function element-wise on an array. The output of the operation is a new array. In Julia docs they have mentioned that the vectorized dot is not performant in Julia and writing your own loops and performing functions on each element of array is recommended, but this doesn't mean they are not useless, in fact in most cases they make the code very convenient. Any function in Julia can be applied elementwise to any array with the syntax `f.(A)`. 

Since in its core, `√` is a function we can also write it like this: `sqrt.([4, 25, 49])`. The result will be same as our example. On the other hand the `^` operator is not a function and is an infix operator, meaning it requires two two arguments to be performed. 

### `@.` macro: 
Sometimes the function we want to apply element-wise to an array can be complex, and writing dot before every operator can be very cumbersome. In these cases, we can use `@.` macro which enhances the readability of our code and at the same times perform the exact same operation. For example:

```julia
A = [1, 2, 3]

# We want to perform 2x^2 + sin(x) to each element of this array. We write:
@. 2A^2 + sin(A)

# Output: [2.8414709848078967, 8.909297426825681, 18.14112000805987]
```
The macro `@.` performs a single loop over `A` and computes $2x^2 + \sin(x)$ for each element of `A`. 

## Numerical Comparison
You can read the list of numerical comparison in Julia, in the [docs](https://docs.julialang.org/en/v1/manual/mathematical-operations/#Numeric-Comparisons). 

Here I want to point out an interesting aspect of chaining the comparisons on elements of an array. 

Using dot syntax of the Julia we can also perform chained comparison on element of an array with ease. Before explaining this, it is worthwhile to mention that chained comparison use `&&` for scalar comparisons, and `$` for element-wise comparisons. This allows them to work on arrays. For example:

```julia
A = [0.5, 2, 3]

# We want to see if 0 < x < 1 holds for each element of the array:

@. 0 < A < 1 # Or: 0 .< A .< 1

# Output: [true, false, false]
```

In this example the chained comparison is applied on each element of the array and the output is an array of boolean of the size of the original array. 

#### Note:
You can read the explanation of other part of the operations directly from the documentation. The explanation is great there, and there is no need to add extra examples and explanations. 

### Resources:

[Julia docs](https://docs.julialang.org/en/v1/manual/mathematical-operations/)

[Dot Syntax for vectorized functions](https://docs.julialang.org/en/v1/manual/functions/#man-vectorized)
