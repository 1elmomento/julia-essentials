# Mathematical Operations in Julia

# Addition
a = 1 + 2 + 3 # Output: 6

# Subtraction:
b = 1 - 2 # Output: -1

# Multiplication/Division
c = 3 * 2 / 12 # Output: 0.5

# Inverse Division
A = [4 3; 1 2]
b = [5, 6]

# Sovling the equation Ax = b
x = A \ b # Output: [6.5, -7.0]

#=
Using inverse division: In the above equation for solving x = b / A, we needed to compute inverse of A.
Using inverse division we don't need to, because this operators provides us that without the need of inversing the A. 
In fact, here instead of inversing A, and then multiplying it by b, we use the short-hand version of it, we just type:

x = A \ b

This short-curt as same as this operation: x = Inverse of A * B
=#


# False as a strong zero in multplicaiton
d = NaN * false # Output: 0.0
e = Inf * false # Output: 0.0

# Integer division and division operators:

#=
There are three operators related to division in Julia, one was inverse division which I introduced above, the others 
called "divide" and "integer divide". 

divide operator, always returns a floating-point value, that is the result of division. Integer divide on the other hand,
returns integer part of the result, is always an integer. Examples

The symbol for integer division is ÷ and we use LaTex format to produce it: `\div + tab`. First we write the \div then we press the tab.
=#

f = 5 / 2 # Output: 2.5
g = 5 ÷ 2 # Output: 2

# Boolean Operators. 

#=
There are three boolean operators that can be applied to expression. These operators are  NEGATION, AND, and OR. 
The interesting thing here is that the AND and OR operators are short-circuiting operators. Please read the README.md ifle
or the julia docs for more information. For negation we use ! symbol, and for AND and OR we use && and || respectively.      
Here are some example of these operators:
=#

h = true
!h # Output: false

d = false

h && d # Output: false
h || d # Output: true

# Example of short-circuiting in action:
m = false
n = println("second expression")
result = m && n
#=
What we expect? Since expression m is false, short-circuiting will not evaluate the second expression. This means the result 
will "false" and the "second expression" will not be printed in the output. The short-circuiting is similar to logical boolean, 
we effectively say that if m is true, then call the println function. If it is not true, return with the first expression's value. 
=#

# Bitwise operators

#=
The explanations for bitwise operators in the README.md file is comrehensive, and there is no need to mention them here. Either 
read the documention (recommended) or read the README.md file. 
=#
