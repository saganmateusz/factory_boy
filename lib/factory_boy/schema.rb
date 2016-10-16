module FactoryBoy
  class Schema
    attr_accessor :attribute_names
    def initialize
      self.attribute_names = Hash.new
    end

    def method_missing(meth, args, &block)
      self.attribute_names[meth.to_s] = args
    end
  end
end
