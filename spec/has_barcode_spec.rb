require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/models/has_png_barcode')
require File.expand_path(File.dirname(__FILE__) + '/models/has_pdf_barcode')
require File.expand_path(File.dirname(__FILE__) + '/models/has_annotate_pdf_barcode')

describe "A class that has a barcode" do
  before(:each) do
    @model = HasPngBarcode.new
  end

  it "should have a barcode configuration" do
    @model.class.barcode_configurations.should_not be_nil
    @model.class.barcode_configurations[:barcode].should_not be_nil
  end

end

describe "an instance that has a barcode" do
  before(:each) do
    @model = HasPngBarcode.new
  end

  it "should have a barcode" do
    @model.barcode.should_not be_nil
    @model.barcode.should be_kind_of(Barby::Barcode)
  end

  it "should have a barcode with a value defined by a proc" do
    @model.barcode.to_s.should eql(@model.random_string_of_numbers)
  end

  it "should have barcode data that corresponds to the outputter" do
    @model.barcode_data.should eql(Barby::Code39.new(@model.random_string_of_numbers).to_png)
  end

  it "should have pass the opts from barcode data to outputter" do
    opts = { :xdim => 2 }
    @model.barcode_data(opts).should eql(Barby::Code39.new(@model.random_string_of_numbers).to_png(opts))
  end
end

describe "an pdf instance that has a barcode" do
  before(:each) do
    @model = HasPdfBarcode.new
  end

  it "should have a barcode" do
    @model.barcode.should_not be_nil
    @model.barcode.should be_kind_of(Barby::Barcode)
  end

  it "should have a barcode with a value defined by a proc" do
    @model.barcode.to_s.should eql(@model.random_string_of_numbers)
  end

  it "should have barcode data that corresponds to the outputter" do
    @model.barcode_data.should eql(Barby::Code39.new(@model.random_string_of_numbers).to_pdf)
  end

  it "should have pass the opts from barcode data to outputter" do
    opts = { :xdim => 2 }
    @model.barcode_data(opts).should eql(Barby::Code39.new(@model.random_string_of_numbers).to_pdf(opts))
  end
end

describe "an annotate_pdf instance that has a barcode" do
  before(:each) do
    @model = HasAnnotatePdfBarcode.new
    @prawn = Prawn::Document.new
  end

  it "should have a barcode" do
    @model.barcode.should_not be_nil
    @model.barcode.should be_kind_of(Barby::Barcode)
  end

  it "should have a barcode with a value defined by a proc" do
    @model.barcode.to_s.should eql(@model.random_string_of_numbers)
  end

  it "should have barcode data that corresponds to the outputter" do
    prawn = Prawn::Document.new
    Barby::Code39.new(@model.random_string_of_numbers).annotate_pdf(prawn)
    
    @model.barcode_data(@prawn)
    
    @prawn.render.should eql(prawn.render)
  end

  it "should have pass the opts from barcode data to outputter" do
    opts = { :xdim => 2 }
    prawn = Prawn::Document.new
    Barby::Code39.new(@model.random_string_of_numbers).annotate_pdf(prawn, opts)
    
    @model.barcode_data(@prawn, opts)
    
    @prawn.render.should eql(prawn.render)
  end
end
