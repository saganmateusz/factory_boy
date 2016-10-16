require 'singleton'
require 'factory_boy/schema'
module FactoryBoy
  class Register
    include Singleton
    attr_accessor :registered_classes
    def initialize
      @registered_classes = Hash.new
    end

    def register_class(name_of_class, &block)
      registered_classes[name_of_class.to_s] = FactoryBoy::Schema.new
      registered_classes[name_of_class.to_s].instance_eval(&block) if block_given?
      true
    end
  end
end
