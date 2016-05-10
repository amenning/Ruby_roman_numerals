# The program takes an integer containing and converts it to a string of Roman Numerals
# For numbers 1-4999, the original seven symbols are used:
# I (1), V (5), X (10), L (50), C (100), D (500), M (1000)
#
# Author::		Carl Andrew Menning (mailto:menning23@gmail.com)
# Copyright:: 	Copyright (c) 2016 

class Converter
		
	attr_reader :romanNum
	
	@@romanOnesConvert=["I","II","III","IV","V","VI","VII","VIII","IX"]
	@@romanTensConvert=["X","XX","XXX","XL","L","LX","LXX","LXXX","XC"]
	@@romanHundredsConvert=["C","CC","CCC","CD","D","DC","DCC","DCCC","CM"]
	@@romanThousandsConvert=["M","MM","MMM","MMMM","MMMMM","MMMMMM","MMMMMMM","MMMMMMMM","MMMMMMMMM"]
	
	def int_to_rom(number)
		@number = number
		@romanNum=""
		if (number<9999)
			convert_thousands()
			convert_hundreds()
			convert_tens()
			convert_ones()
		else
			@romanNum="Greater than 5000"
		end
		return @romanNum
	end
	
	def convert_thousands()
		thousandsCount = @number/1000 # This will conduct numbereger division and automatically round down
		@number -= thousandsCount*1000
		@romanNum += @@romanThousandsConvert[thousandsCount-1] unless thousandsCount == 0
	end
	
	def convert_hundreds()
		hundredsCount = @number/100
		@number -= hundredsCount*100
		@romanNum += @@romanHundredsConvert[hundredsCount - 1] unless hundredsCount == 0
	end
	
	def convert_tens()
		tensCount = @number/10
		@number -= tensCount*10
		@romanNum += @@romanTensConvert[tensCount - 1] unless tensCount == 0
	end
	
	def convert_ones()
		onesCount = @number
		@number -= onesCount
		@romanNum += @@romanOnesConvert[onesCount - 1] unless onesCount == 0
	end
end