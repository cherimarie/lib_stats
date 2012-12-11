class CategoryBuilder 

	def initialize

	end

	def build(library, csv_file)

		csvreader = CsvReader.new
		csvreader.read_in(csv_file)

		category_array = []
		csvreader.categories.each do |hash|
			category_array << Category.new(library, hash)
		end 

		return category_array
	end 



end 