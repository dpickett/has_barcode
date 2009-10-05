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
      include InstanceMethods
      options = args.extract_options!
      @barcode_configurations ||= {}
      @barcode_configurations[args.first] = HasBarcode::Configuration.new(options)
    end

    def barcode_configurations
      @barcode_configurations
    end
  end

  module InstanceMethods
  end
end
