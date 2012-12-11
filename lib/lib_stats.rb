require 'csv'
require_relative 'lib_stats/category.rb'
require_relative 'lib_stats/library.rb'
require_relative 'lib_stats/csvreader.rb'
require_relative 'lib_stats/categorybuilder.rb'

class Lib_Stats
	attr_accessor :name, :category_array, :library, :loser_array

	def initialize(args = {})

		@library = Library.new({name: args[:name],
								quantity: args[:quantity],
								checkouts: args[:checkouts]})

		inputfile = CategoryBuilder.new
		@category_array = inputfile.build(@library, args[:file])

		@category_array.each do |count|
			@library.quantity += count.quantity
			@library.checkouts += count.checkouts

		end


	end


	def display
			output = ""
		@category_array.each do |stuff|
			output += "#{stuff.name} \n"
			output += "Quantity: #{stuff.quantity} \n"
			output += "% of Total Books: #{stuff.percent_of_total} \n"
			output += "Checkouts: #{stuff.checkouts} \n"
			output += "% of Total Checkouts: #{stuff.percent_of_checkouts} \n"
			output += "Performance (average number of checkouts per book in category): #{stuff.performance} \n"
			output += "------------- \n"
		end

		return output

	end


	def winners
		best_score = 0.01
		loser_array = []
		winner_array = []
		output = ""

		@category_array.each do |stuff|

		#collect best performers
			if stuff.performance > best_score
				best_score = stuff.performance
				winner_array.clear
				winner_array << stuff
			end

		#collect worst performers
		if stuff.percent_of_checkouts == 0
			loser_array << stuff
		end

		end

		output += "Losers:"
			loser_array.each do |loser|
				output += "#{loser.name} /n"
			end

		output += "Winner:"
			winner_array.each do |winner|
				output += "#{winner.name}"
			end

		return output


	end


end
