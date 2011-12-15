module HasBarcode
  class Configuration
    attr_reader :name, :barcode_class, :outputter_class
    def initialize(*args)
      opts = args.extract_options!
      opts.symbolize_keys!

      @name = args.first

      require "barby/barcode/#{opts[:type]}"
      @barcode_class = Barby.const_get("#{opts[:type].to_s.classify}")

      require "barby/outputter/#{opts[:outputter]}_outputter"
      @outputter = Barby.const_get("#{opts[:outputter]}_outputter".classify)
    end


  end
end
