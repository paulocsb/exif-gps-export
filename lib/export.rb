require 'csv'

class Export

	def initialize(images: [], format: 'csv')
		@images = images
		@format = format
	end

	def call
		case @format
		when 'html' then
			File.open("./src/output/export.html", "w"){ |f| f.write export_to_html }
		when 'csv' then
			CSV.open("./src/output/export.csv", "wb", { col_sep: ";" }){ |f| export_to_csv f }
		else
			raise "Format is invalid."
		end
  end

  private

	  def export_to_csv csv
	  	csv << ['File Name', 'Latitude', 'Longitude']
	    @images.map do |image|
	      csv << [image.filename, image.latitude, image.longitude]
	    end
	    csv
	  end

	  def export_to_html
	    """
			<!DOCTYPE html>
			<html>
			  <head>
			    <title>EXIF GPS Extractor</title>
			    <style>
			    	body, html { margin:0; border:0; padding: 0; font-family: arial, sans-serif; }
						.container { margin:0 auto; max-width: 960px; text-align: left; }
						.page-header { margin-bottom: 35px; border-bottom: 1px solid #ccc; }
						.info { font-size: 12px; margin-bottom: 20px; }
						.info-item { padding: 5px; 10px; }
			    </style>
			  </head>
			  <body>
			    <div class='container'>
			    	<div class='page-header'>
			      	<h1>EXIF GPS Extractor</h1>
		      	</div>
			      <table>
			        <tbody>
			          #{print_images}
			        </tbody>
			      </table>
			    </div>
			  </body>
			</html>
	    """
	  end

	  def print_images
	    @images.map do |image|
	      """
				<tr>
				  <td>
				  	<div>
					    <img src='../../#{image.filename}' style='height: 300px' />
					    <img src=\"#{image.map_url}\" style='height: 300px' />
				    </div>
				    <div class='info'>
				    	<div class='info-item'>
				    		<b>File:</b> #{image.filename}
			    		</div>
			    		<div class='info-item'>
					    	<b>Latitude:</b> #{image.latitude}
				    	</div>
				    	<div class='info-item'>
					    	<b>Longitude:</b> #{image.longitude}
				    	</div>
				    </div>
				  </td>
				</tr>
	      """
	    end.join(" ")
	  end
end