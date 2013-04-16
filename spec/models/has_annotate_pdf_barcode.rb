require File.expand_path(File.dirname(__FILE__) + '/has_barcode_helper')

class HasAnnotatePdfBarcode
  include HasBarcode
  include HasBarcodeHelper

  has_barcode :barcode, 
    :outputter => :annotate_pdf, 
    :type => :code_39,
    :value => Proc.new{|p| p.random_string_of_numbers}

end
