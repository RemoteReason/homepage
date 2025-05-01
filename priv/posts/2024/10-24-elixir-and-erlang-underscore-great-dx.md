%{
  title: "Underscore in Erlang & Elixir - Great DX lang feature",
  thumbnail: "10-24-underscore.jpg",
  author: "Paul Sabou",
  tags: ~w(webapps elixir lang),
  description: "The _ features is a really important DX language feature. It helps the developper communicate it's intention clearly and also eliminates unnecessary possible confusions when we read the code."
}
---


## Variable binding - always once with one exception
In Erlang/Elixir variables can be binded only once. This is typical in many functional languages & it's the way to express immutability in the language. Once we assigned a variable name to a value it cannot be reassigned anymore.

Bad: This does not compile as we try to rebind an already binded variable
```
a = 1
a = 2
```

Good: This compiles as we bind each variable only once
```
a = 1
b = 2
```

So this is the general rule for all variables. There is only one exception: the underscore or any variable that starts with "_" (ie. "_", "_a", "_b", etc.).
The underscore is the only variable that :
* can be bound multiple times
* cannot be read 

The second property is pretty important. If we would be able to read a variable that starts with "_" then these variables would provide a hack around the language immutablity. 
As we cannot read the variable it's not a problem that it can be binded multiple times => we still can bind only once the variables that can be read 

Ok great. But this seems a pretty strange exception. Why introduce this feature? 
The short answer is that the underscore exception is there just as a way to tell the compiler "i don't care about what is there".
And this is important because it simplifies several core language features:
* extracting pattern matching
* catch all clauses
* ignore function returns
* specific function signatures

## 1. Extractive pattern matching

Without the _ exception matching complex data types & tuples would have forced us to always use variable names that we would never use in our scope. 
These variables would make our code less readable and introduce confusion. 
A person reading it the first time would not be able to say which variables in our scope are used for lexical reasons (ie. keep the pattern matching system happy) 
and which are really used & needed for the business logic of the code.

### Not so clear: Extractive pattern matching without _
```
person = {"John","Doe","john.doe@gmail.com"}

# I need only email but I need to use all variables just to get to it
{first_name, last_name, email} = person
```

Confusion: Are we really using first_name & last_name? Where? Why? 

### Readable: Extractive pattern matching with _
```
person = {"John","Doe","john.doe@gmail.com"}

# I need only email so I extract only e-mail
{_, _, email} = person
```

Clarity: We only care about e-mail. Ignore the rest. 


## 2. Catch all clauses in case matching

Often case statements can be interrested on some values & simply "lump together" all "the rest" with some default behavior. 
Underscore "_" is an expressive way to indicate this default / catch all case. The alternative would be less nice - use a variable name that is not really used in the business logic.

### Not so clear: Catch all without _
```
case colour_code do
  "red" -> 1
  "blue" -> 2
  colour_i_dont_care_about -> 3
end
```

Confusion: Are we really using "colour_i_dont_care_about"? Where? Why? 

### Readable: Catch all with _
```
case colour_code do
  "red" -> 1
  "blue" -> 2
  _ -> 3
end
```

Clarity: If none of the explicit values matched then match the "catch all" 

## 3. Function calls that don't return anything or we don't care about the returns

A typical use case is in "with" statements when we assume that a sequence of function calls return as expected. 
In this case we need sometimes to be able to tell the compiler that we simply don't care about the return of some function at all.

Below is an example where we have a sequence of important business logic steps. At the end we call an analytics service and we don't care if it failes (ie. fire and forget)

### Not so clear: We introduce a variable but we never use it
```
with {:ok, a} <- update_important_records(),
     {:ok, b} <- delete_important_records(),
     whatever <- notify_analytics() do
      a
     end
```

Confusion: Are we really using "whatever"? Where? Why? 

### Readable: We clearly don't care about the last function - notify_analytics()
```
with {:ok, a} <- update_important_records(),
     {:ok, b} <- delete_important_records(),
     _ <- notify_analytics() do
      a
     end
```

Clarity: We really don't care about the last function. 

## 4. Function signatures with unused variables

For various reasons we have to implement functions with a specific signature (for example to implement a specific behavior). 
But our specific function inplementation might not need all the variables in the function signature. 
Without the _ language feature we would be forced to invent variable names that we don't use and thus confuse the reader which variables are actually needed or not.

### Not so clear: We need variable arg2 because we need to implement a "do_work" function with 2 arguments
```
def do_work(arg1, arg2) do
  # use arg1 but not arg2
end
```

Confusion: Are we really using "arg2"? Where? Why? 

### Readable: We have a "do_work function with 2 arguments but we use only the first argument
```
def do_work(arg1, _) do
  # use arg1 
end
```

Clarity: We really don't care about the second arg of the function. 


## Conclusion
The _ features is a really important DX language feature. It helps the developper communicate it's intention clearly and also eliminates unnecessary possible confusions when we read the code.


## References
- [Learn You Some Erlang for great good!](https://learnyousomeerlang.com/syntax-in-functions#pattern-matching)