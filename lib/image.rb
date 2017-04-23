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
		exif 				= Exif::Data.new(@filename)
    @latitude 	= !!exif.gps_latitude ? exif.gps_latitude : "unknown"
    @longitude 	= !!exif.gps_longitude ? exif.gps_longitude : "unknown"
    @map_url 		= "http://maps.googleapis.com/maps/api/staticmap?center=#{@latitude},#{@longitude}&zoom=2&size=400x300&markers=#{@latitude},#{@longitude}&key=AIzaSyAh1tBFgvSyKSXg7igNv-ajDRLeRs2qdXU"
    self
  rescue RuntimeError
    image_unknown
	end

	private

		def image_unknown
			Image.new(
				filename: 	'unknown',
				latitude: 	'unknown',
				longitude: 	'unknown',
				map_url: 		'unknown')
		end
end