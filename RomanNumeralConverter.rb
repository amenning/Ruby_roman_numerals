class Converter
	attr_reader :romanNum
	
	@@romanOnesConvert=["I","II","III","IV","V","VI","VII","VIII","IX"]
	@@romanTensConvert=["X","XX","XXX","XL","L","LX","LXX","LXXX","XC"]
	@@romanHundredsConvert=["C","CC","CCC","CD","D","DC","DCC","DCCC","CM"]
	@@romanThousandsConvert=["M","MM","MMM","MMMM","MMMMM","MMMMMM","MMMMMMM","MMMMMMMM","MMMMMMMMM"]
	
	def int_to_rom(number)
		@number = number
		@romanNum=""
		# Need to check if number is equal to or above 10000
		convert_thousands()
		convert_hundreds()
		convert_tens()
		convert_ones()
		puts @romanNum
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


# function convert(num) {
  # var romanNum="";
  # var romanOnesConvert=["I","II","III","IV","V","VI","VII","VIII","IX"];
  # var romanTensConvert=["X","XX","XXX","XL","L","LX","LXX","LXXX","XC"];
  # var romanHundredsConvert=["C","CC","CCC","CD","D","DC","DCC","DCCC","CM"];
  # var romanThousandsConvert=["M","MM","MMM","MMMM","MMMMM","MMMMMM","MMMMMMM","MMMMMMMM","MMMMMMMMM"];
  
  # var thousandsCount = Math.floor(num/1000);
  
  # if(thousandsCount>0){
    # romanNum+=romanThousandsConvert[thousandsCount-1];
    # num=num-thousandsCount*1000;
  # }
  
  # var hundredsCount = Math.floor(num/100);
  
  # if(hundredsCount>0){
    # romanNum+=romanHundredsConvert[hundredsCount-1];
    # num=num-hundredsCount*100;
  # }
  
  # var tensCount = Math.floor(num/10);
  
  # if(tensCount>0){
    # romanNum+=romanTensConvert[tensCount-1];
    # num=num-tensCount*10;
  # }
  
  
  # if(num>0 && num<10){
    # romanNum+=romanOnesConvert[num-1];
  # }
  # return romanNum;
# }