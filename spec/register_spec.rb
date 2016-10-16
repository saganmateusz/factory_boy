require 'spec_helper'
describe FactoryBoy::Register do 
    let (:registry) {FactoryBoy::Register.instance}
    it 'properly registers classes' do
        registry.register_class(NotUser)
        expect(registry.registered_classes.keys).to include('NotUser')
    end

    

    
end