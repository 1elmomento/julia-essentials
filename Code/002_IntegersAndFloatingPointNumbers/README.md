Here we learn about Integers and floating-point numbers in Julia programming language and we will talk about concepts like overflow in memory and how Julia handles this. 

Integers and floating-point numbers are extremely important for performing arithmetic and computations using programming languages. In Julia built-in representations of these values are called **numeric primitives** and any value we assign is called numeric literals. For example the number 123 is an numeric literal, but `Int8` is numeric primitive type. 

**Numeric Primitives**: In programming languages primitive data types are used to construct other data types. In specific, primitive data types are set of limited data types which are available for CPU and all compiled programs must use them. 

**Numeric Literals**: These are constant values that are used to represent numbers. As mentioned before, the number 123 is considered a numeric literal, or the number 1 is integer literal and number 1.0 is floating point literal. The representation of these numbers as binary objects in memory is called numeric primitives. 

In Julia programming language, there is broad range of numeric primitive data types at our disposal. These data types are as follows: 

## Integer Types in Julia:

|Type|Signed?|Number of bits|Smallest Value|Largest Value|
|----|-------|--------------|--------------|-------------|
|`Int8`|yes|8|$-2^7$|$2^7 - 1$|
|`UInt8`|no|8|$0$|$2^8 - 1$|
|`Int16`|yes|16|$-2^{15}$|$2^{15} - 1$|
|`UInt16`|no|16|$0$|$2^{16} - 1$|
|`Int32`|yes|32|$-2^{31}$|$2^{31} - 1$|
|`UInt32`|no|32|$0$|$2^{32} - 1$|
|`Int64`|yes|64|$-2^{63}$|$2^{63} - 1$|
|`UInt64`|no|64|$0$|$2^{64} - 1$|
|`Int128`|yes|128|$-2^{127}$|$2^{127} - 1$|
|`UInt128`|no|128|$0$|$2^{128} - 1$|
|`Bool`|N/A|8|`false` (0)|`true` (1)|

## Floating-point types in Julia:

|Type|Precision|Number of bits|
|----|---------|--------------|
|`Float16`|`half`|16|
|`Float32`|`single`|32|
|`Float64`|`double`|64|

Imagine we define a variable `a` of type of `Int8`. This means we allocate only 8 bits of memory to represent this number as binary. We learned that each type have a smallest value and largest value. These are the minimum or the maximum values that a type can hold. What would happen if we define a variable of type `Int8` and assign a number like 400 to it? 400 is greater than the maximum value that an `Int8` number can hold. In this case we do not encounter a phenomenon like overflow, instead Julia here raises an `InexactError`. 

On the other hand let's define another variable like this:

```julia
# Julia
b = typemax(Int8)
b + 1 # Output: 128
```

In this example we set the variable to the largest value of `Int8` type. `typemax` is a built-in function of Julia. After defining this variable we add 1 to the `Int8`'s maximum allowed value which 127. The output of this code will be 128. Usually here we expect a overflow to happen, because as mentioned earlier, 127 is the largest value of `Int8` type, but instead of overflow, we get a valid output. This is called `promotion` in Julia. Julia sees we are trying to cross the limit of a type and automatically promotes `Int8` to common type of the system which is `Int64`. This behaviors prevents unexpected overflow in the code. 

First let me quickly explain what an overflow is and then let's talk about promotions and conversions in Julia. Integer overflow happens when we try to exceed the 

An integer overflow is a type of an "arithmetic" overflow error when the result of an integer operation does not fit within the allocated memory space. Instead of an error in the program, it usually causes the result to be unexpected. Integer overflow have been listed as the number 9 most dangerous software error in the CWE 2019 list, mostly because they often lead to buffer overflow. 

So as you can see integer overflow is an important concept that must be addressed while coding. 

There are mainly three methods to handle overflow errors in programming languages:

* Modular Arithmetic: Modular arithmetic or wraparound is a common approach to handle overflow in programming languages. In this case the value wraps around to the beginning of the range. Julia and C uses this approach.

* Raising an Error: Some languages or libraries raise an error when overflow is detected. 

* Clamping: some systems set overflowed values to the nearest limit, but this method is less common. 

Now let's discuss two behaviors in Julia programming language. First we have this code:

```julia
# Julia
a::Int8 = 400
```
This is not a valid code. Since we assign `Int8` type to variable `a`, the maximum number that `a` can hold is 127. Here we don't get an overflow, but rather we get an error called `InexactError`. In Julia `InexactError` raised when we try to assign a value to a variable that cannot represent that value exactly. Here didn't perform any arithmetic operations on variable `a` and only we assigned a value to it. 

To get overflow in Julia, we have to do some arithmetic operation on the value. For example consider this code:

```julia
# Julia
b = typemax(Int64)
b + 1 # Output: -9223372036854775808
```

In here we get an overflow error, but it is handle using modular arithmetic and there for the result of the `b + 1` code will be the smallest value that an `Int64` type can hold, which is -9223372036854775808.

## Promotion
Consider this example:

```julia
# Julia
a = typemax(Int8)
b = a + 1
typeof(b) # Output: Int64
```
In previous example I mentioned here a promotion occurs and `Int8` get promoted automatically to `Int64`. If we check the type of the variable `b` we get `Int64`. This automatic promotion of types can prevent unintentional bugs that causes overflow. 

## Resources
[Integer Overflow](https://www.acunetix.com/blog/web-security-zone/what-is-integer-overflow/)

[Promotion in Julia Language](https://docs.julialang.org/en/v1/manual/conversion-and-promotion/)

[Julia Docs](https://docs.julialang.org/en/v1/manual/integers-and-floating-point-numbers/)