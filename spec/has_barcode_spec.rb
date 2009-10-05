require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "A class that has a barcode" do
  before(:each) do
    @model = HasPngBarcode.new
  end

  it "should have a barcode configuration" do
    @model.class.barcode_configurations.should_not be_nil
  end

end
