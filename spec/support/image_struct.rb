require 'ostruct'

class ImageStruct

	IMAGE_HASH = { filename: "image.jpg", latitude: "11.3333", longitude: "-11.3333" }.freeze

  def initialize file
  end

  def call
    OpenStruct.new(IMAGE_HASH)
  end
end