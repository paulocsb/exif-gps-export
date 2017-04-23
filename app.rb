require 'bundler'
require 'optparse'
Bundler.require

require_relative "./lib/extractor.rb"

class App
  def initialize(*args)

    options = Hash.new

    OptionParser.new do |parser|
    	parser.banner = "Usage: app.rb [options]"

		  parser.on("-f", "--format=FORMAT", "# Output format file. Options: (csv/html).", "# Default: csv") do |v|
		    options[:format] = v
		  end

		  parser.on("-d", "--directory=DIRECTORY", "# Especify a directory wich is a relative path where the project is.") do |v|
		  	options[:directory] = v
		  end
		end.parse!

		if options.empty?
			Extractor.new.call
		else
			Extractor.new(options).call
		end
  end

end
App.new(*ARGV)