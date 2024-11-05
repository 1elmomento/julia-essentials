# Integer Literal
a = 1

# Floating-point Literal
b = 2.4

# In Julia, we can also assign types for the numbers:
# To see the full list of numeric types you can visit Julia's docs or this folder's README.md file.
vairable1::UInt8 = 1
variable2::Int16 = -23
variable3::Int32 = 456
variable4::Float16 = 1.234
variable5::Float64 = 3.423452123

# The default type of an integer in Julia programming language, depends and the architecture of the system:

# 32-bit systems:
typeof(1) # Output: Int32

#64-bit systems:
typeof(1) #Output: Int64

# To see which architecture the system uses, we can use Julia's internal variable called Sys.WORD_SIZE:

# 32-bit systems:
Sys.WORD_SIZE # Output: 32

# 64-bit systems:
Sys.WORD_SIZE # Output: 64

# Julia's conversion and promotion mechanism:

#=
In general, In defining a variable of specific type and assigning a value to it that cannot be represented by that type,
Julia automatically promots the type of the number to 64-bit type, regardless of the system architecture. 
Usually in these scenario, we expect a overflow to happen, using promotion of types, Julia prevents Integer Overflow. 
Here is an example from the documentation:
=#

# In 32-bit or 64-bit systems:
typeof(3000000000) # Output: Int64


# The minimum and maximum represantable values of primitive numeric types:
# Using built-in methods, `typemin` and `typemax` we can output the minimum and maximum representable value using that specific type:
(typemin(Int8), typemax(Int8)) # Output: (-128, 127)
(typemin(UInt16), typemax(UInt16)) # Output: (0x0000, 0xffff)

# Hexadecimals in Julia
#=
In above example you can see the out put of the typemin(UInt16) is in hexadecimal format. 
In Julia "unsigned" hexadecimals are input and output using the 0x prefix and hecadecimal digits 0-9a-f. 
So in our example, `0x0000` is hexadecimal representation of the number `0`. On the other hand, 
0xffff is hexadecimal represenation of number `65535` or 2^16 - 1. So in short: Julia represents hexdecimal numbers using above
`0x` prefix. 
=#

# Overflow: In Julia exceeding the maximum representable value of a given type results in wraparound behavior:

x = typemax(Int64) # Here we assign the maximum representable value of type Int64 for to variable x.
y = x + 1 # In here we perform a simple arithmetic, and we add 1 to that number.
println(y) # The output is going to be the minimum reperesentable value for type `Int64`, which is: -9223372036854775808

# If we want to store very large numbers without wraparound overflow behavior we do as follows:
# First let see when we define a very large value:
z = 10^19 # Output: -8446744073709551616. Here overflow is happend. 

# solution:
z = big(10)^19 # Output: 10000000000000000000
# In above example, `big(x)` convert a number to a maximum precision representaion

# Final note:

# For more examples of integers and floating-point numbers, visit https://docs.julialang.org/en/v1/manual/integers-and-floating-point-numbers/