module FactoryBoy
    class Schema
        attr_accessor :attribute_names
        
        def initialize
            attribute_names = {}
        end
        
        def method_missing(name, *args, &block)
            attribute_names[name] = *args
        end
    end
end