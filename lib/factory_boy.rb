require "factory_boy/version"
require 'factory_boy/register'
require 'factory_boy/schema'
module FactoryBoy
    def self.define_factory(name_of_class, &block)
      registry = Register.instance
      registry.register_class(name_of_class.to_s, &block)
      true
    end

    def self.build(name_of_class, attributes = {})
      registry = Register.instance
      default_attributes = registry.registered_classes[name_of_class.to_s].attribute_names
      default_attributes.merge!(attributes)
      built_class = Object.const_get(name_of_class.to_s)
      built_class.new(default_attributes)
    end
end
