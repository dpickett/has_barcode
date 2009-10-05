class HasPngBarcode
  include HasBarcode

  has_barcode :barcode, 
    :outputter => :png, 
    :type => :code_39,
    :value => Proc.new{|p| p.random_string_of_numbers}

  def random_string_of_numbers
    if !@string_of_numbers
      @string_of_numbers = []
      5.times {@string_of_numbers << rand(9)}
    end

    @string_of_numbers.join("")
  end
end
