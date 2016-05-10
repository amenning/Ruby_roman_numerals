# The program takes an integer containing and converts it to a string of Roman Numerals
# For numbers 1-4999, the original seven symbols are used:
# I (1), V (5), X (10), L (50), C (100), D (500), M (1000)
#
# Author::		Carl Andrew Menning (mailto:menning23@gmail.com)
# Copyright:: 	Copyright (c) 2016 

class Converter
		
	attr_reader :romanNum
	
	@@romanHash = {
		1 => "I", 2 => "II", 3 => "III", 4 => "IV", 5 => "V", 6 => "VI", 7 => "VII", 8 => "VIII", 9 => "IX",
		10 => "X", 20 => "XX", 30 => "XXX", 40 => "XL", 50 => "L", 60 => "LX", 70 => "LXX", 80 => "LXXX", 90 => "XC",
		100 => "C", 200 => "CC", 300 => "CCC", 400 => "CD", 500 => "D", 600 => "DC", 700 => "DCC", 800 => "DCCC", 900 => "CM",
		1000 => "M", 2000 => "MM", 3000 => "MMM", 4000 => "MMMM", 5000 => "MMMMM", 6000 => "MMMMMM", 7000 => "MMMMMMM", 8000 => "MMMMMMMM", 9000 => "MMMMMMMMM"
	}
	
	# @@romanOnesConvert=["I","II","III","IV","V","VI","VII","VIII","IX"]
	# @@romanTensConvert=["X","XX","XXX","XL","L","LX","LXX","LXXX","XC"]
	# @@romanHundredsConvert=["C","CC","CCC","CD","D","DC","DCC","DCCC","CM"]
	# @@romanThousandsConvert=["M","MM","MMM","MMMM","MMMMM","MMMMMM","MMMMMMM","MMMMMMMM","MMMMMMMMM"]
	
	def int_to_rom(number)
		@number = number
		@romanNum=""
		if (number<9999)
			convert_thousands()
			convert_hundreds()
			convert_tens()
			convert_ones()
		else
			@romanNum="Greater than 9999"
		end
		return @romanNum
	end
	
	def convert_thousands()
		thousandsCount = @number/1000 # This will conduct numbereger division and automatically round down
		@number -= thousandsCount*1000
		@romanNum += @@romanHash[thousandsCount*1000] unless thousandsCount == 0
	end
	
	def convert_hundreds()
		hundredsCount = @number/100
		@number -= hundredsCount*100
		@romanNum += @@romanHash[hundredsCount*100] unless hundredsCount == 0
	end
	
	def convert_tens()
		tensCount = @number/10
		@number -= tensCount*10
		puts tensCount
		@romanNum += @@romanHash[tensCount*10] unless tensCount == 0
	end
	
	def convert_ones()
		onesCount = @number
		@number -= onesCount
		@romanNum += @@romanHash[onesCount] unless onesCount == 0
	end
end