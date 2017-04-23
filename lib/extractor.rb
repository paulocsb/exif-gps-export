require 'bundler'
Bundler.require

require_relative "./image.rb"
require_relative "./export.rb"

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
		files 	= Dir.glob(@directory)
		images 	= files.map { |filename| get_exif_from_filename filename }
		Export.new(images: images, format: @format).call
	rescue => e
		raise e
	else
		print_message
	end

	private

		def print_message
  		puts "Exported to #{@format.upcase}: src/output/export.#{@format.downcase}"
  	end

		def get_exif_from_filename filename
	    @image_obj.new(filename: filename).call
	  end
end