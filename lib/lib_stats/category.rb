class Category
	attr_reader :name, :quantity, :checkouts


	def initialize(library, args = {})
		@library = library
		@name = args[:name] || "Category Name"
		@quantity = args[:quantity].to_i || 0
		@checkouts = args[:checkouts].to_i || 0
	end

	def percent_of_total
		return (@quantity.fdiv(@library.quantity) * 100).round(1)
	end


	def percent_of_checkouts
		return (@checkouts.fdiv(@library.checkouts) * 100).round(1)
	end


	def performance
		return @checkouts.fdiv(@quantity).round(3)
	end






end