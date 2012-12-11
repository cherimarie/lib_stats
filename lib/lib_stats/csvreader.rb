class CsvReader
	attr_accessor :categories, :quantity, :checkouts

	def initialize
		@categories = []
		@library_quantity
		@library_checkouts
	end


	def read_in(csv_filename)
		CSV.foreach(csv_filename, headers: true) do |row|
			@categories << { name:      row["Category"],
							 quantity:  row["Quantity"],
							 checkouts: row["Checkouts"] }
		end

		return "reading #{csv_filename}"
	end

end