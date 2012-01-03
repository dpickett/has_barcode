module HasBarcode
  class Configuration
    attr_reader :name, :barcode_class, :outputter_class
    def initialize(*args)
      opts = ActiveSupport::HashWithIndifferentAccess.new(args.last.kind_of?(Hash) ? (args.last || {}) : {})

      @name = args.first

      require "barby/barcode/#{opts[:type]}"
      @barcode_class = Barby.const_get(ActiveSupport::Inflector.classify("#{opts[:type].to_s}"))

      require "barby/outputter/#{opts[:outputter]}_outputter"
      @outputter = Barby.const_get(ActiveSupport::Inflector.classify("#{opts[:outputter]}_outputter"))
    end


  end
end
