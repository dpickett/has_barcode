require "rubygems"
require "active_support"
require "barby"

require "has_barcode/configuration"

module HasBarcode
  def self.included(base)
    base.send(:extend, ClassMethods)
  end

  module ClassMethods
    def has_barcode(*args)
      options = args.extract_options!
      @@barcode_configurations ||= {}
      @@barcode_configurations[args.first] = HasBarcode::Configuration.new(options)

      define_method args.first do
        if options[:type] == :code_128
          @@barcode_configurations[args.first].barcode_class.new(options[:value].call(self), 'A')
        else
          @@barcode_configurations[args.first].barcode_class.new(options[:value].call(self))
        end
      end

      define_method "#{args.first}_data" do
        send(args.first).send("to_#{options[:outputter]}")
      end

    end

    def barcode_configurations
      @@barcode_configurations
    end
  end

end
