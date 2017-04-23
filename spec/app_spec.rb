require_relative "../app.rb"
require_relative "./support/image_struct.rb"

describe App do

  context 'when exporting with invalid formats' do
    it "format: pdf" do
      expect { Extractor.new(format: 'pdf').call }
        .to raise_error RuntimeError, /Format is invalid./
    end
    it "format: blank" do
      expect { Extractor.new(format: '').call }
        .to raise_error RuntimeError, /Format is invalid./
    end
  end

  context 'when exporting with valid formats' do
    it "format: csv" do
      expect do
        Extractor.new(image_obj: ImageStruct, format: 'csv').call
      end.to output("Exported to CSV: src/output/export.csv\n").to_stdout
    end
    it "format: html" do
      expect do
        Extractor.new(image_obj: ImageStruct, format: 'html').call
      end.to output("Exported to HTML: src/output/export.html\n").to_stdout
    end
  end

  context "when exporting and the file doesn't contain exif data" do
    it "format: csv" do
      expect do
        Extractor.new(image_obj: Image).call
      end.to include('') && output("Exported to CSV: src/output/export.csv\n").to_stdout
    end
    it "format: html" do
      expect do
        Extractor.new(image_obj: Image, format: 'html').call
      end.to include('') && output("Exported to HTML: src/output/export.html\n").to_stdout
    end
  end

end
