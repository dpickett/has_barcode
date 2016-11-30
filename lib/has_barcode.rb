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
        @@barcode_configurations[args.first].barcode_class.new(options[:value].call(self))
      end

      define_method "#{args.first}_data" do |*meth_args|
        if meth_args
          send(args.first).send("to_#{options[:outputter]}", *meth_args)
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
