class Image
	attr_reader :filename, :latitude, :longitude, :map_url

	def initialize(
		filename: 	'',
		latitude: 	'',
		longitude: 	'',
		map_url: 		'')

		@filename 	= filename
		@latitude 	= latitude
		@longitude 	= longitude
		@map_url		= map_url
	end

	def call
	end
end
