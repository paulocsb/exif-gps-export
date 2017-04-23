require 'bundler'
Bundler.require

class Extractor
	attr_reader :directory, :format

	DEFAULT_DIRECTORY	= ""
	DEFAULT_FORMAT		=	"csv"

	def initialize(
		directory: 	DEFAULT_DIRECTORY,
		format: 		DEFAULT_FORMAT)
	end

	def call
	end
end