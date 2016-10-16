require 'singleton'
module FactoryBoy
    class Register
        include Singleton
        attr_accessor :registered_classes
        
        def initialize
            @registered_classes = {}
        end
        def register_class(name_of_class, &block)
            if !registered_classes.keys.include? name_of_class.to_s
                registered_classes[name_of_class.to_s] = Schema.new
                registered_classes[name_of_class.to_s].instance_eval(block) unless block.nil?
                true
            else
                registered_classes[name_of_class.to_s] = {}
            end
        end

        
    end
end