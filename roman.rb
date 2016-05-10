# The Roman class contains custom methods to convert an integer or floating number to Roman Numerals.
# This version uses the original Roman Numerals for 1-4999, with the option to define new symbols for any integer
# value other than 1 (I) and 5 (V).
#
# The default symbols are:
# - I (1)
# - IV (4)
# - V (5)
# - IX (9)
# - X (10)
# - XL (40)
# - L (50)
# - XC (90)
# - C (100)
# - CD (400)
# - D (500)
# - CM (900)
# - M (1000)
#
# The methods below are also implemenented with the following constraints:
#
# "Implement an integer-to-roman-numeral formatting function
# - ...that permits assigning symbols for values other than 1 and 5, without changing the code
# - ...that can represent floating-point numbers, using an encoding scheme of your choice (explain!)"
#
# New symbols defintions can be assigned using the update_symbols method using a hash of definitions, such as {40 => "T"}
# This method also will convert floating-point numbers to 3 decimal places using the instance symbol definitions from 0.001 to 0.999, such that 0.001 = ".I" and 0.999 = ".CMXCIX"
#
# Author::		Carl Andrew Menning 
# Version::		0.0.1
# License::		Distributed under the same terms as Ruby
class Roman
		
	attr_reader :roman_hash

	# The initialize method creates an instance version of Roman Numerals contained within a hash
	# such that the key is the integer value and the value is the corresponding Roman Numeral symbol
	#
	# * *Args*	  :
	#	- +options+ -> hash accepting new Roman Numeral defintions, for example, to replace XL for 40: {40 => "T"}
	# * *Returns* :
	# 	- roman_hash -> instance hash containing all current symbol definitions
	# * *Raises*  :
	#	This method contains no additional error checks
	def initialize(options = {})
		reset_symbols!
		
		update_symbols(options)
	end

	# The int_to_rom method is the main method used to convert an integer or floating number to Roman Numerals
	# using the current symbol definition contained within the instance variable @roman_hash.
	# This method will convert floating point numbers to 3 decimals such that 0.001 = ".I" and 0.999 = ".CMXCIX"
	# and will use any updated integer symbols as appropriate 
	#
	# * *Args*	  :
	#	- +number+ -> Fixnum, Bignum, or Float to be converted to Roman Numerals
	# * *Returns* :
	# 	- String containing converted number into defined Roman Numerals
	# * *Raises*  :
	#	This method contains no additional error checks	
	def int_to_rom(number)
		# 1. Separate input number to be converted into integer and fractional portions
		# 1a. Integer portion can be separated by using Ruby's to_i method 
		integer_portion = number.to_i
		# 2b. This method only converts the fractional portion to 3 decimal points ranging from 0.001 - 0.999
		# 		The fractional portion is treated as integer numbers 1-999, such that 0.001 = ".I" and 0.999 = ".CMXCIX"
		#		and will incorporate any updated symbol changes accordingly.  In order to avoid floating point errors
		#		the manipulation is adjusted by 1000 to ensure all digits to be converted are integers
		number *= 1000
		number -= integer_portion*1000
		fractional_portion = number.to_i
		
		# 3. Initialize final Roman Numeral sring to return "" if inputed number is 0
		total_roman_num = ""
		# 4. Convert integer portion unless this is equal to 0
		total_roman_num = convert_int(integer_portion) unless integer_portion == 0
		# 5. Add decimal point and convert fractional portion unless fractinoal portion is equal to 0
		total_roman_num += "." unless fractional_portion == 0
		total_roman_num += convert_int(fractional_portion) unless fractional_portion == 0
		return total_roman_num
	end

	# The convert_int method is the method used to convert subset integers to Roman Numerals
	# using the instance defined symbols contained within @roman_hash
	#
	# * *Args*	  :
	#	- +number+ -> Fixnum or Bignum to be converted to Roman Numerals
	# * *Returns* :
	# 	- String containing converted number into defined Roman Numerals
	# * *Raises*  :
	#	This method contains no additional error checks		
	def convert_int(number)
		roman_num = ""
		#The following chain of commands takes the hash containing symbol definitions and does:
		# 1. .sort = Converts hash to array of [key, values] sorted by the key in ascending order
		# 2. .reverse = Converts array to be sorted by descending order of key 
		# 3. .map = Iterates on each [key, value] array 
		# 3a. The current number is divided by the current integer key and the whole number from the division is stored in a repeat variable and the remainder is stored into an updated number for next iteration
		# 3b. The current letter symbol is repeated a number equal to repeat, for example "I"*3 = "III"
		# 4. .join combines all array string elements into a single final string
		roman_num = @roman_hash.sort.reverse.map do |integer, letter|
			repeat, number = number.divmod(integer)
			letter * repeat
		end.join
		return roman_num
	end

	# The update_symbols method is the method used to define any new symbols to 
	# be used for conversion.  This method accepts a hash with new definitions with
	# the key the integer value and the value the corresponding symbol.  This method will 
	# not ignore floating point number definitions and any attempt to redefine the symbols for 1 or 5.
	# For example, to update the symbol for 40 from "XL" to "T": update_symbols({40 => "T"})
	#
	# * *Args*	  :
	#	- +options+ -> hash accepting new Roman Numeral defintions, for example, to replace XL for 40: {40 => "T"}
	# * *Returns* :
	# 	- roman_hash -> instance hash containing all current symbol definitions
	# * *Raises*  :
	#	This method contains no additional error checks	
	def update_symbols(options = {})
		# Iterate on each key, value pair in the options 
		# 1. Check that new integer assignment does not overwrite 1 or 5 and is of type Fixnum or Bignum; if not, ignore
		# 2. Assign integer key in instance hash containing all assignments with new letter symbol
		options.each do |integer, letter|
			if (integer!=1 && integer!=5 && (integer.is_a?(Fixnum) || integer.is_a?(Bignum)))
				@roman_hash[integer] = letter
			end
		end
		return @roman_hash
	end

	# The reset_symbols method used to redefine the instance hash containing Roman Numeral definitions
	# to the original set of definitions and clear any changes that have been made.
	#
	# * *Args*	  :
	#	- This method has no arguments
	# * *Returns* :
	# 	- roman_hash -> instance hash containing all original symbol definitions
	# * *Raises*  :
	#	This method contains no additional error checks		
	def reset_symbols!
		@roman_hash = {
			1 => "I",
			4 => "IV",
			5 => "V",
			9 => "IX",
			10 => "X",
			40 => "XL", 
			50 => "L", 
			90 => "XC",
			100 => "C", 
			400 => "CD", 
			500 => "D", 
			900 => "CM",
			1000 => "M"
		}
		return @roman_hash
	end	
end