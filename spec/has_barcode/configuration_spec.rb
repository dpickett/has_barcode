require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "a barcode configuration" do
  before(:each) do
    @configuration = HasBarcode::Configuration.new(:barcode,
      :outputter => :png,
      :type => :code_39
    )
  end

  it "has a name" do
    @configuration.name.should_not be_nil
    @configuration.name.should eql(:barcode)
  end

  it "has a barcode class derived from the symbol" do
    @configuration.barcode_class.should eql(Barby::Code39)
  end

  it "has a barcode class that can be derived via string" do
    @configuration = HasBarcode::Configuration.new(:barcode,
      :outputter => :png,
      :type => 'code_39'
    )
    @configuration.barcode_class.should eql(Barby::Code39)
  end

  it 'can take a barcode class directly' do
    require 'barby/barcode/code_39'
    @configuration = HasBarcode::Configuration.new(:barcode,
      :outputter => :png,
      :type => Barby::Code39
    )
  end
  
  it 'pdf should not throw exception during require' do
    proc {
      HasBarcode::Configuration.new(:barcode,
        :outputter => :pdf,
        :type => :EAN_13
      )
    }.should_not raise_error( LoadError )
  end
  
end
