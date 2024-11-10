# Floating-Point numbers:

# In Julia, floating point numbers are represented using IEEE 754 standard. Julia also support E-notaion.
a = 1.0 # Output: 1.0
b = 1.0 # Output: 1.0
c = 0.5 # Output: 0.5

aa = 1e10 # Output: 1.0e10
bb = 2.5e-4 # Output: 0.00025

#= By default Julia consideres all floating-point numbers to be of type of `Float64`. If we want Literal `Float32` we use an `f`
in place of e. For example:
=#

x = 0.5f0 # Output: 0.5f0
typeof(x) # Output: Float32

# For e-notation:
y = 2.5f-4 # Output: 0.00025f0
typeof(y) # Output: Float32

# Promotion and Conversion in Floating-point numbers
# Consdier this example:
e::Float16 = 1.234567890123456789
println(e) # Output: 1.234567890123456789

# Obviosly we cannot store 1.234567890123456789 in 16-bit allocated memory but why overflow didn't happen here?
# It's because we also have here a promotion. Under the hood Julia converted e to support that number.
# What if we want to convert 1.234567890123456789 to Float16 number? We do it using this method:
f = Float16(1.234567890123456789)
println(f) # Output: Float16(1.234)

# For full explanation of this behavior visit the README.md file, or read the resources I provided at the of that file. 


# Floatin-point zero:

# In Julia there is two zero for floating point numbers: 0.0 and -0.0
0.0 == -0.0 # Output: true

# But the bitstring of these two are not the same, meaning the binary represenation of these two zeros are different:
bitstirng(0.0) # Output: "0000000000000000000000000000000000000000000000000000000000000000"
bitstring(-0.0) # Output: "1000000000000000000000000000000000000000000000000000000000000000"

# One thing I didn't mentioned in README.md file is the special floating-point values

#=
There are three specified standard floating-point values that do not correspond to any point on the real number line:

For Float16 these are: Inf16, -Inf16, and NaN16
For Float32 these are: Inf32, -Inf32, and NaN32
For Float64 these are: Inf, -Inf, NaN
=#

# These special cases have some interesting arithmetic operations that I share some of them here:

a1 = 1 / Inf # Output: 0.0
a2 = 1 / 0 # Output: Inf
a3 = -5 / 0 # Output: -Inf

a4 = 0 / 0 # Output: NaN
a5 = Inf - Inf # Output: NaN
a6 = Inf * Inf # Output: Inf
a7 = 0 * Inf # Output: NaN (interesting)

NaN == NaN # Output: false
NaN < NaN # Output: false
NaN > NaN # Output: false

# About Machine epsilon, rounding mode and nextfloat or prevfloat, we will talk in section 004 of this series. 