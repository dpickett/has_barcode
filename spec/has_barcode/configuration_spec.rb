require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "a barcode configuration" do
  before(:each) do
    @configuration = HasBarcode::Configuration.new(:barcode,
      :outputter => :png,
      :type => :code_39
    )
  end

  it "should have a name" do
    @configuration.name.should_not be_nil
    @configuration.name.should eql(:barcode)
  end

  it "should have a barcode class" do
    @configuration.barcode_class.should eql(Barby::Code39)
  end

  it "should have an outputter" do
    @configuration.outputter.should eql(Barby::PngOutputter)
  end
end
describe "a barcode configuration with class set" do
  before(:each) do
    @configuration = HasBarcode::Configuration.new(:barcode, :outputter => :png, :type => :ean_13, :barcode_class_name => "EAN13")
  end

  it "should have a name" do
    @configuration.name.should_not be_nil
    @configuration.name.should eql(:barcode)
  end

  it "should have a barcode class" do
    @configuration.barcode_class.should eql(Barby::EAN13)
  end

  it "should have an outputter" do
    @configuration.outputter.should eql(Barby::PngOutputter)
  end

end

