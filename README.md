# What's Roman

The Roman class contains custom methods to convert an integer or floating number to Roman Numerals.
This version uses the original Roman Numerals for 1-4999, with the option to define new symbols for any integer
value other than 1 (I) and 5 (V).

The default symbols are:
* I (1)
* IV (4)
* V (5)
* IX (9)
* X (10)
* XL (40)
* L (50)
* XC (90)
* C (100)
* CD (400)
* D (500)
* CM (900)
* M (1000)

New symbols defintions can be assigned using the update_symbols method using a hash of definitions, such as {40 => "T"}
This method also will convert floating-point numbers to 3 decimal places using the instance symbol definitions from 0.001 to 0.999, such that 0.001 = ".I" and 0.999 = ".CMXCIX"

## Features of Roman

* 	it permits assigning symbols for values other than 1 and 5, without changing the code
* 	it can represent floating-point numbers to 3 decimal points

## How to use

This is what you need to do to use this custom Roman class:

1.  Ensure you have ruby installed on your machine

2.  Download this repository and require the roman.rb file in your program

3.  Create a Roman instance and call the int_to_rom method 

```bash
# Require the roman.rb file in your program with the correct pathname
require './roman'

# Create a new instance of the Roman class with optional hash containing new symbol definitions
convert = Roman.new({40 => "T"})

# Call the Roman int_to_rom method on a whole integer or floating number object and the Roman Numeral equivalent will be returned
convert.int_to_rom(23) # This will return "XXIII"
convert.int_to_rom(23.0231) # This will return "XXIII.XXIII"; note that it only converts 3 decimal points and in this case ignored the 0.0001
convert.int_to_rom(40) # This will return "T" because of the custom symbol definition
convert.reset_symbols! # This will reset all symbols back to the original symbol definitions
convert.int_to_rom(40) # This will return "XL" because of the custom symbol definition
convert.update_symbols({40=>"Z"}) # This will redefine the symbol for 40 to "Z"
convert.int_to_rom(40) # This will return "Z" because of the custom symbol definition

```

## The Author

This custom roman numeral converter method was created by Carl Andrew Menning