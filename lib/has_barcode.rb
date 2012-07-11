require "rubygems"
require "i18n"
require "active_support"
require "active_support/hash_with_indifferent_access.rb"
require "active_support/inflector.rb"
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

      define_method "#{args.first}_data" do |opts = nil|
        if opts
          send(args.first).send("to_#{options[:outputter]}", opts)
        else
          send(args.first).send("to_#{options[:outputter]}")
        end
      end

    end

    def barcode_configurations
      @@barcode_configurations
    end
  end

end
