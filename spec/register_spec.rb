require 'spec_helper'
describe FactoryBoy::Register do 
  let (:registry) {FactoryBoy::Register.instance}
  it 'properly registers classes' do
    registry.register_class(NotUser)
    expect(registry.registered_classes.keys).to include('NotUser')
  end

  it 'properly sets default values' do
    registry.register_class(NotUser) do
      not_name 'test_name'
      not_age 1
    end
    expect(registry.registered_classes['NotUser']).to be_instance_of FactoryBoy::Schema
    expect(registry.registered_classes['NotUser'].attribute_names.keys).to include 'not_name'
    expect(registry.registered_classes['NotUser'].attribute_names.keys).to include 'not_age'
    expect(registry.registered_classes['NotUser'].attribute_names['not_name']).to eq 'test_name'
    expect(registry.registered_classes['NotUser'].attribute_names['not_age']).to eq 1
  end
end
