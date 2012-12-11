require './lib/lib_stats.rb'

describe Library do

	before do
		@libraryDec = Library.new({name: "Dec", quantity: 4600, checkouts: 550})
	end

	it "should be able to tell performance" do
		@libraryDec.performance == 0.12
	end

end

describe Category do

	before do
		@libraryDec ||= Library.new({name: "Dec", quantity: 4600, checkouts: 550})
		@sociology = Category.new(@libraryDec, {name: "Sociology", quantity: 143, checkouts: 11})
	end

	it "should be able to tell size of category as part of whole library" do
		@sociology.percent_of_total.should == 3.1
	end

	it "should be able to tell checkout percentage" do
		@sociology.percent_of_checkouts.should == 2
	end

	it "should be able to tell total performance" do
		@sociology.performance.should == 0.077
	end

end

describe CsvReader do

	before do
		@test = CsvReader.new
	end

	it "should be able to import data from a CSV file" do
		@test.read_in("LibraryStatisticsTestData.csv")
		@test.categories.length.should == 3
	end

end

describe CategoryBuilder do

	before do
		@buildy = CategoryBuilder.new
		@category_array = @buildy.build(@libraryDec, "LibraryStatisticsTestData.csv")
	end

	it "should build categories from array in csvreader" do
		@category_array.count.should == 3
	end

end

describe Lib_Stats do

	before do
		@app_test = Lib_Stats.new(name: 'app_test', file: 'LibraryStatisticsTestData.csv')
	end

	it "should configure library totals" do
		@app_test.library.quantity.should == 177
	end

	it "should configure library checkouts" do
		@app_test.library.checkouts.should == 32
	end

	it "should be able to know all category objects, with their percentages" do
		@app_test.display.should include ("% of Total Books: 71.2")
		@app_test.display.should include ("% of Total Checkouts: 34.4")
		@app_test.display.should include ("Performance (average number of checkouts per book in category): 0.0")
	end

	it "should be able to show best and worst peformers" do
		@app_test.winners.should include 'Losers:Health and'
	end

end






