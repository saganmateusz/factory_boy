class NotUser
    attr_accessor :not_name, :not_age
    def initialize(args = {})
        args.each do |key, value|
            instance_variable_set("@#{key}", value) unless value.nil?
        end
    end
end