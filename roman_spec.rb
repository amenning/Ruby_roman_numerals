require './roman'

describe Roman do
	before(:each) do
		@roman_converter = Roman.new
	end
	
	it "allows access to instance roman_hash symbol definitions" do
		expect(@roman_converter.roman_hash).not_to eq(nil)
	end

	it "allows instance roman_hash symbol definitions to be modified" do
		@roman_converter.update_symbols({40 => "T"})
		expect(@roman_converter.roman_hash[40]).to eq("T")
	end

	it "does not allow instance roman_hash symbols for 1 to be modified" do
		@roman_converter.update_symbols({1 => "T"})
		expect(@roman_converter.roman_hash[1]).to eq("I")
	end

	it "does not allow instance roman_hash symbols for 1 to be modified" do
		@roman_converter.update_symbols({5 => "T"})
		expect(@roman_converter.roman_hash[5]).to eq("V")
	end
	
	it "allows instance roman_hash symbol definitions to reset" do
		@roman_converter.update_symbols({40 => "T"})
		@roman_converter.reset_symbols!
		expect(@roman_converter.roman_hash[40]).to eq("XL")
	end	
	
	it "allows instance roman_hash symbol definitions to be modified upon initialization" do
		@roman1 = Roman.new({40 => "T"})
		expect(@roman1.roman_hash[40]).to eq("T")
	end	

	it "separates instance roman_hash symbol definitions from other instances" do
		@roman1 = Roman.new({40 => "T"})
		@roman2 = Roman.new()
		expect(@roman2.roman_hash[40]).to eq("XL")
	end			

	it "correctly converts whole integers to Roman Numerals using original definitions" do
		expect(@roman_converter.int_to_rom(23)).to eq("XXIII")
	end	
	
	it "correctly converts floating numbers to Roman Numerals to 3 decimal points  using original definitions" do
		expect(@roman_converter.int_to_rom(23.0231)).to eq("XXIII.XXIII")
	end			
	
	it "correctly converts floating numbers to Roman Numerals to 3 decimal points  using modified definitions" do
		@roman_converter.update_symbols({20 => "T"})
		expect(@roman_converter.int_to_rom(23.0231)).to eq("TIII.TIII")
	end	
end