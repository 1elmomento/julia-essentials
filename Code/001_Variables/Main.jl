# Variable Assignments:

variable1 = 10
variable2 = "Hello, this is a varialbe"

# We can also do math using a's value:
variable3 = variable1 + 1 # Output: 11

# Reassignments:
variable1 = 123

#= 
The varialbe2 was initial of type of string, but we assign it to a integer value.
Here Juia automatically infere the type of the variable, 
althogh we can assign types by ourselves which we will discuss later.
=#
variable2 = 1

#=
Unicode Names:

One very nice feature of Julia is that we can Unicode names as variable names. 
For example in scientific programming, we often use names like `alpha` or `beta` for some parameters.
Julia enables us to use the actual symbol of these Unicode characters in the code. 

Julia enables us to define these characters using their LaTex symbol name. 
So if you are familiar with LaTex you should easily define these variables in your code for more readability. 

We define these varialbe with this structre: `\alpha`-tab. For example:
=#
α = 1.2 # (\alpha-tab = 1.2)
β = 0.2 # (\beta-tab = 0.2)
Σ = 23 # (\Sigma-tab = 23)
σ = 2.5 # (\sigma-tab = 2.5)

#= 
Chained variables:

Another very interesting feature of Julia is that in this language we can chain variable names. 
This means the definition `variable1 = variable2 = value` is a valid definition. You can read more about this
in README.md file. 

For example:
=#
a = (b = 2 + 2) + 1 # The output of a will be 7, and the output of b will be 4. This structure is not valid in Python. 