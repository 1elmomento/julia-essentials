In previous section (Integers and Floating-point Numbers) We learned about integers in Julia programming language but we didn't talked about floating point numbers in this language. In this post, we learn a little about floating-point numbers in computing and we explore it in Julia. 

## Floating-point numbers:
If you have a background in sciences like Physics, you may be familiar with the concept known as scientific notation. Scientific notation is a floating-point number. 

In computing, floating point numbers are a way to represent real numbers in computers. Using these numbers we can represent broad range of real numbers and perform arithmetic operations on them. However, since computers use limited memory for dealing with numbers we lost the precision of real numbers in computers. This means we cannot represent a real number in computers with the actual precision of the number. 

In general a floating point number have this form:

$$
x = m_0\cdot m_1 m_2 ... m_{p-1}\times \beta^{e}
$$

In this representation, $m_0\cdot m_1 m_2 ... m_{p-1}$ is called the signifcand, $\beta$ is called base or radix, $e$ is called the exponent, and finally $p$ is the precision of the number.

## Storing floating-point numbers:

Floating-point numbers are usually stored using the IEEE 754 standard. In this standard a floating-point number has three main parts:

* Sign bit: This bit indicates the sign of the number, meaning whether the number is positive or negative. 

* Exponent: Determines the scale or magnitude of the number, essentially shifting the decimal point. 

* Significand: Contains the significant digits of the number representing the precision. 

There three types of formatting in computing: Half-precision (16-bit), single-precision (32-bit), and double-precision (64-bit). In the IEEE 754 standard for storing a single precision floating point number we have the following representation:

* 1 bit for the sign
* 8 bits are for the exponent
* 23 bits are for the significant. 

Half precision numbers are often used in applications that need to store a lot of data with low precision, such as machine learning models for inference, image processing, and where memory is limited. 

Single precision numbers are widely used for general applications where performance and memory efficiency are important, such as 3D graphics, gaming, and many scientific computations that require extreme precision.

Double precision numbers are preferred for high-accuracy scientific computations, financial calculations, and applications in physics or engineering where precision is critical. 

Now let's look at how Julia handle floating-point numbers. Consider these examples:

```julia
a::Float16 = 1.234567890123456789
# Output: 1.234567890123456789
```

In this code we define a variable `a` and assign a half precision floating-point type `Float16` to it. For half precision numbers, the approximate number of significant digits that can be stored in memory is calculated from the following formula:

$$
\text{Decimal Precision} \approx n\log_{10}(2)
$$

Where $n$ denotes the number of bits available for significand and the sign bit in memory. Since half-precision numbers require 11 bits (10 for significand and 1 for sign bit) the Decimal precision for half-precision floating point will be approximately 3.3. This means the output of the above code should be 1.234 (something between 3 and 4 for number of digits). However we see the output is `1.234567890123456789`. Why is that? 

The answer is again Julia's type conversion and promotion mechanism. When we assign that number to the variable, Julia sees that it cannot store that number in a `Float16` type, therefore it automatically promotes the type to `Float64`. In order to solve this issue we have to explicitly say we want a `Float16` number and don't promote the type. For this we write this code:

```julia
a = Float16(1.234567890123456789)
# Output: Float16(1.234)
``` 

In here Julia's conversion mechanism takes action and convert our number to a `Float16` floating point number. 

The same goes for single-precision and double-precision numbers as well:

```julia
b = Float32(1.234567890123456789)
# Output: 1.2345679f0
```
Here at the end of the output we have a new symbol we didn't see in half-precision numbers. The `f0` at the end of of the output indicates the our number is a 32-bit floating-point number. The `f` denotes a floating-point type, and `0` is the exponent part. 

For the `Float64` we have this example:

```julia
c = Float64(1.234567890123456789)
# Output: 1.2345678901234567
```
One interesting question that you try to answer it. Why the rounding in `Float16` results in `1.234` and not `1.235`. In the `Float32` we see that the output is rounded meaning, instead of `1.2345678` we get `1.2345679`. Try to explain this. 

### Resources:
[Julia Programming Language](https://docs.julialang.org/en/v1/manual/integers-and-floating-point-numbers/)

Muller, Jean-Michel, et al. *Handbook of Floating-Point Arithmetic*, Second Edition. 

[IEEE Arithmetic](https://docs.oracle.com/cd/E19957-01/806-3568/ncg_math.html)