require "factory_boy/version"
require 'factory_boy/register'
require 'factory_boy/schema'
module FactoryBoy
    def self.define_factory(name_of_class, &block)
        registry = Register.instance
        registry.register_class(name_of_class, block)
        true
    end
    
    def self.build(name_of_class, attributes = {})
        built_class = Object.const_get(name_of_class.to_s)
        built_class.new(attributes)
    end
end
