require_relative "../lib/image.rb"

describe Image do
  let(:exif) { ExifDouble }

  context "when image doesn't contain exif data (unknown)" do
	  it "defaults to unknown" do
	    expect(Image.new.call)
	    	.to have_attributes(filename: "unknown", latitude: "unknown", longitude: "unknown", map_url: "unknown")
	  end
	  it "defaults to no gps data" do
	    expect(Image.new(filename: 'src/images/no-gps-data/csorux.jpg').call)
	    	.to have_attributes(filename: "src/images/no-gps-data/csorux.jpg", latitude: "unknown", longitude: "unknown",)
	  end
	end
end