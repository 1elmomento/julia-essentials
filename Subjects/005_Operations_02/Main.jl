# Updating Operators


# Addition
a = 2
a += 3  # Output: 4

# Multiplication
b = 5
b *= 2 # Output: 10

# Subtraction
c = 4
c -= 1 # Output: 3

# Division
d = 5
d /= 2 # Output: 2.5

#= 

For every mathematical and bitwise operators there is a updating version, 
which you can find the list and comrehensive explanation here:
https://docs.julialang.org/en/v1/manual/mathematical-operations/#Updating-operators
=#

# Vectorized dot

# In Julia for every operator there is dot version as well. See the Julia's docs or README.md file of this subject
A = [1, 2, 3]
B = A .^ 3 # Output: [1, 8, 27]

D = [4, 25, 49]
E = .√A # Output: [2.0, 5.0, 7.0]
F = sqrt.(A) # [2.0, 5.0, 7.0]
# Note that .√ and sqrt. are equivalent and performing them on arrays yields a identical results. 

# Applying 2x^2 + sin(x) to each element of A, can be done in using vectorzied dot:
G = 2 .* (A) .^ 2 + sin.(A) # Output: [2.8414709848078967, 8.909297426825681, 8.909297426825681]

#= 
Writing all those vectorized dot operators in complicated equations can be cumbersome
Julia provides `@.` macro for simplifying it. The above operation can be written as follows:
=#
H = @. 2(A)^2 + sin(A) # Output: [2.8414709848078967, 8.909297426825681, 8.909297426825681]

# Note: For more information please see the Julia's docs or the resources at the bottom of the README.md file. 

# Numeric Comparison
1 == 1 # Output: true
1 == 2 # Output: false
1 != 2 # Output: true
1 == 1.0 # Output: true
1 < 2 # Output: true
1.0 > 5 # Output: false
-1 <= -1 # Output: true
-1 ≤ 3 # Output: true
5 ≠ 4 # Output: true

# For writing those symbols we use LaTex code of those symbols. For example for inequalitiy we write: \neq + tab

# Interesting feature of numeric comparisons in mathematical objects:
NaN == NaN # Output: false
NaN != NaN # Output: true
NaN < NaN # Output: false
NaN > NaN # Output: false

# This behavior of the NaN can cause problems when comparing two arrays. For example:
[1 NaN] == [1 NaN] # Output: false

# This is why Julia provides us set of functions that can be very useful in these situations. 
# This is the list of the functions that we can use to compare numbers and arrays:
# isequal(x, y) - isfinite(x) - isinf(x) - isnan(x)
# Examples:
isequal(NaN, NaN) # true
isequal([1 NaN], [1 NaN]) # true
isequal(NaN, NaN32) # true

-0.0 == 0.0 # true
isequal(-0.0, 0.0) # false 
# negative zero and positive zero are not equal. Finding out the reason could be helpful to understand the comparison mechanism in Julia. 


# Chaining comparisons:
# Most languages with exception of Python, don't support chained comparisons. For example:
1 < 2 <= 2 < 3 == 3 > 2 >= 1 == 1 < 3 != 5 # Output: true

# We can also chain the comparisons in vectorized dot syntax to apply chained comparisons on each element of an array:
XX = [0.5, 2, 3]
YY = @. 0 < XX < 1 # Output: [1, 0, 0] or [true, false, false]

#= 
In Julia docs there is section for elementary functions and operator precedence and associativity. It is recommended to read these section directly from the docs:
https://docs.julialang.org/en/v1/manual/mathematical-operations/#Elementary-Functions
https://docs.julialang.org/en/v1/manual/mathematical-operations/#Operator-Precedence-and-Associativity

One important note here is the following example:
=#

x = 3
2x^2 # Output: 18
2^2x # Output: 64

#= 
In previous sections I mentioned that numerical coefficients are treated as multplication, 
so here, 2x is 2 * x. Multiplications have higher precedence than any other binary operation, 
with exception of ^ operator, where they have higher precedence only as the exponent: 
This means: In the first expression, first 2x gets evaluted then the power operator gets evaluated.
In the second expression since the mulplication is in the exponent, first the multplication gets evaluated 
and after that the exponentiation gets performed. It is worthwhile to remember this precedence to avoiod unintended bugs. 
=#


# Numerical Conversions

# Here are some of the methods using which we can convert one numerical value to a specific type:

# Converting a value to Int8 type:
Int8(127) # Output: 127
Int8(128) # Output: InexactError. We covered this in Subject 002. The number 128 cannot be represented exactly by an Int8 type.

Int8(127.0) # Output: 127
Int8(128.0) # Output: InexactError. The number 128.0 cannot be represented exactly by an Int8 type.

# We can also use % operator for converting a value of integer type T congurent to x modulo 2^n, where n is the number of bits in T. 
# This means the binary represenation of the value is truncated to fit the available bits of that type:
127 % Int8 # Output: 127
128 % Int8 # Output: -128. Here an overflow is occured. 

# We can also use round(T, x) function to convert the type of the value. For example:
round(Int8, 127.4) # Output: 127
round(Int8, 127.6) # Output: InexactError. We cannot represent 127.6 by Int8 type. 

#= 
For more information read this:
https://docs.julialang.org/en/v1/manual/conversion-and-promotion/#conversion-and-promotion
=#

#= 
The rest of documention is about 
rounding functions,
division functions,
sign and absolute value functions,
powers, logs and roots, 
and trigonometric and hyperbolic functions. 

You can read about them here:
https://docs.julialang.org/en/v1/manual/mathematical-operations/#Rounding-functions

Here I just provide some examples of interesting functions:
=#

round(3.2) # Output: 3.0 => Here the type of returned value is of the same of the value itself. Meaning, output is of type of the argument. 
round(Int8, 3.2) # Output: 3 => Here the type of returned value is specified in first argument of the round function. 

# Other rounding functions also bahve similarly. Read the description of each rounding function.

# In copysign(x, y) function the output has the magnitude of x and the sign of the y.
copysign(123, -3.4) # Output: -123 

# In flipsign(x, y) funciton the putput has the magnitude of x and the sign x*y
flipsign(-123, -3.4) # Output: 123

# To see if the sign bit of the value is on or not:
signbit(123) # false
signbit(-123) # true

div(1, 2) # Output: 0 => This is equivalent to x ÷ y and the quotient of the division is rounded toward 0. 
fld(1, 2) # Output: 0 => floored division; quotient rounded towards -Inf
cld(1, 2) # Output: 1 => ceiling division; quotient rounded towards +Inf

gcd(1, 2, 3, 4, 5) # Output: 1 => Greatest positive common divisor of 1, 2, 3, 4, 5 (gcd(x, y, ...))
lcm(1, 2, 3, 4, 5) # Output: 60 => Least positive common multiple of 1, 2, 3, 4, 5 (lcm(x, y, ...))

# Powers, logs and roots:

cbrt(27) # Output: 3.0 => cbrt(x): cube root of x
∛9 # Output: 3.0 => equivalent with cbrt(x) function. They both have the same results.

hypot(6, 8) # Output: 10.0 => Hypotenuse of right-angle triangle with other sides of length x and y.

# Trigonometric functions:

#=
You can see the list of all trigonometric functions in here:
https://docs.julialang.org/en/v1/manual/mathematical-operations/#Trigonometric-and-hyperbolic-functions
=#

#= 
In addition to those functions there is two functions sinpi(x) and cospi(x) for more accurate computations of 
sin(pi * x) and cos(pi * x) respectively.

For example:
=#

sin(pi * √2 / 2) # Output: 0.7956932015674809
sin(π√2 / 2) # Output: 0.7956932015674809
sinpi(√2 / 2) # Output: 0.7956932015674808

cos(pi * √2 / 2) # Output: -0.6056998670788134
cospi(√2 / 2) # Output: -0.6056998670788135

#=
Another cool feature of Julia is this:
In order to compute trigonometric functions with degrees instead of radians, suffix the function with d. For example
sind(x) computes the sine of x,where x is specified in degress. 

For example:
=#

sin(pi / 4) # Output: 0.7071067811865475
sind(45) # Output: 0.7071067811865476

# Note the small difference between the results of two functions. 