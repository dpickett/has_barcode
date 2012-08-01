module HasBarcode
  class Configuration
    attr_reader :name, :barcode_class, :outputter
    def initialize(*args)
      opts = ActiveSupport::HashWithIndifferentAccess.new(args.last.kind_of?(Hash) ? (args.last || {}) : {})

      @name = args.first

      require "barby/barcode/#{opts[:type]}"
      class_name = (opts[:barcode_class_name] || opts[:type]).to_s
      @barcode_class = Barby.const_get(ActiveSupport::Inflector.classify(class_name))

      require "barby/outputter/#{opts[:outputter]}_outputter"
      @outputter = Barby.const_get(ActiveSupport::Inflector.classify("#{opts[:outputter]}_outputter"))
    end


  end
end
