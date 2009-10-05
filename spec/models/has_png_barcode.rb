class HasPngBarcode
  include HasBarcode

  has_barcode :barcode, 
    :outputter => :png, 
    :type => :code_39
end
