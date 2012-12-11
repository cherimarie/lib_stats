class Library 
	attr_accessor :name, :quantity, :checkouts 

	def initialize(args= {})
		@name = args[:name] || librarysoup
		@quantity = args[:quantity] || 0
		@checkouts = args[:checkouts] || 0
	end


	def performance
		return @checkouts.fdiv(@quantity).round(3)
	end



end 