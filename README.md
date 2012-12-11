Library-Statistics
==================

A way to track popularity of different categories of books compared to the entire Library collection.



Initialize a new report by entering data in the following format:
MyLibrary = lib_stats.new({name: 'MyLibrary', file: 'LibraryDataFile.csv'})
Your csv file should contain a list of categories and their respective quantity and checkouts, formatted in three columns, entitled "Category", "Quantity", and "Checkouts". The program will pull the library's total quantity and checkouts from the totals of all the categories.

If you'd like to just see how it works, use the included 'LibraryStatisticsTestData.csv' as your file.

Optionally, you can initialize a library with its totals, in this way:
MyLibrary = lib_stats.new({name: 'MyLibrary', quantity: XXX, checkouts: XXX, file: 'LibraryDataFile.csv'})

Request reports with commands "display" and "winners".
puts MyLibrary.display will display all categories, each with their totals, percentages of library totals, and performance score.
puts MyLibrary.winners will show two lists. The Losers list is all categories whose performance was 0. The Winner list will show the category with the highest performance score.