require 'bundler'
Bundler.require

require_relative "./image.rb"

class Extractor
	attr_reader :directory, :image_obj, :format

	DEFAULT_DIRECTORY	= "src/images"
	DEFAULT_FORMAT		=	"csv"

	def initialize(
		directory: 	DEFAULT_DIRECTORY,
		format: 		DEFAULT_FORMAT,
		image_obj: 	Image)

		@directory 	= "#{directory}/**/*.jpg"
		@format			= format
		@image_obj 	= image_obj
	end

	def call
	end
end
