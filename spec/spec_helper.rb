$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'has_barcode'
require 'spec'
require 'spec/autorun'

require 'spec/models/has_png_barcode'

Spec::Runner.configure do |config|
  
end
