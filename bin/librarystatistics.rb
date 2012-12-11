#!/usr/bin/env ruby

require 'LibraryStatistics'

# to create a CLI file you create a bin directory in your gem root and put a file there called (by default) the name of your gem.
# then make that executable with chmod ug+x

# the gotcha I experienced was that, once you install your gem on your machine, the "require 'csv_filter' "line no longer references your local working directory, instead, it pulls in the gem from your PATH.
# specifically, I think it's in /usr/bin/