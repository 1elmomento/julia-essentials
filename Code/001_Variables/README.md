
# Variables
In this section we explore the variables in Julia programming language. The variables and codes are define inline in `README.md` file but you can also see the full examples of the variables in `Main.jl` file. 

## Variable Names:

Julia variable names can include letters, Unicode characters, and numbers (but a variable name cannot start with a number). The variable names in Julia is case-sensitive and Julia allows Unicode names like $\alpha$, $\beta$, or $\lambda$. This is extremely helpful when we write mathematical formula in our codes. 

Python also supports broad range of Unicode characters since version 3 but restricts variable names to letters, numbers and underscores. Just like Julia, in Python the variable names also cannot start with a number, and Python doesn't support Greek letters for naming the variables. If you want to define a variable called $\alpha$, you have to name it as `alpha`. 

*Comparison*: Julia allows for expressive names, including Greek letters, which is useful in writing expressive mathematical modeling or formula. Python maintains readability with ASCII, making it suitable for broader programming audience. 

## Assignments:

Assignments are similar in both languages and it is done by using equal sign (`=`). In both languages we assign values to variable names in exactly the same way. In Julia we assign a value to variable name like this: `a = 3`. 

One interesting assignment that only applies in Julia world is the chaining of the assignments. For example in Julia this code is valid:
```julia
# Julia
a = (b = 2 + 2) + 3
```
Where, a is equal to 7 and b is equal 4. The same syntax in Python throws a `SyntaxError`. 

I found the chain assignments of values to variables very useful. 

## Valid Characters in Variable Names:

Julia allows underscores, letters, Unicode characters but not special characters like `@` or `!` at the start (except for macros). Interestingly Julia supports emojis in variable names. For example this is valid in Julia:

```julia
# Julia
🙂 = "Hello, Emoji!"
```

The same code throws `SyntaxError` in Python. 

*Comparison*: Julia offers a broader set of allowed characters, which can enhance expressiveness, on the other hand Python is simpler and less prone to misuse, improving readability across projects. 

## Constants:

In Julia programming language, `const` is used to define constants, which Julia enforces for optimal performances in code. After defining a constant, reassigning it results in warning or errors. For example:

```julia
# Julia
const a = 2.1
a = 2
```
Execution of the above code will result in `Error: invalid redefinition of constant Main.a`. 

In Python, it is customary to define constant variables in uppercase letters. For example:

```python
# Python
MY_CONSTANT = 2.1
```
Now if I set `MY_CONSTANT` to another values, Python will not throw any errors and changing the constant variable's value is supported. 

*Comparison*: Julia's built-in `const` helps improve performance by hinting at compiler optimization. On the other hand, Python's constants are convention-based, offering flexibility but it lacks enforced immutability. 

These were the topics I learned today and at the end I want to share the Stylistic Conventions of Julia Programming language:

## Stylistic Conventions of Julia:
While Julia imposes few restrictions on valid names, it has become useful to adopt the following conventions:

* Names of variables are in lower case.
* Word separation can be indicated by underscores ('_'), but use of underscores is discouraged unless the name would be hard to read otherwise.
* Names of Types and Modules begin with a capital letter and word separation is shown with upper camel case instead of underscores.
* Names of functions and macros are in lower case, without underscores.
* Functions that write to their arguments have names that end in !. These are sometimes called "mutating" or "in-place" functions because they are intended to produce changes in their arguments after the function is called, not just return a value.

## Sources:

[Julia Programming Language Docs](https://docs.julialang.org/en/v1/manual/variables/)



