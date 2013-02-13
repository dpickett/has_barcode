module HasBarcode
  class Configuration
    attr_reader :name, :barcode_class, :outputter_class
    def initialize(*args)
      opts = ActiveSupport::HashWithIndifferentAccess.new(args.last.kind_of?(Hash) ? (args.last || {}) : {})

      @name = args.first

      if opts[:type].kind_of?(String) || opts[:type].kind_of?(Symbol)
        require "barby/barcode/#{opts[:type]}"
        @barcode_class = Barby.const_get(ActiveSupport::Inflector.classify("#{opts[:type].to_s}"))
      else
        @barcode_class = opts[:type]
      end

      require "barby/outputter/#{opts[:outputter]}_outputter"
      @outputter = Barby.const_get(ActiveSupport::Inflector.classify("#{opts[:outputter]}_outputter"))
    end


  end
end
