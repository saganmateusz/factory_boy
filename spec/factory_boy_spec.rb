require "spec_helper"
describe FactoryBoy do
  let (:registry) {FactoryBoy::Register.instance}
  let (:built_user) {FactoryBoy.build(User, name: 'Mateusz', age: 26)}
  it "defines a factory" do
    expect(FactoryBoy.define_factory(User)).to be_truthy
  end
  
  it 'builds an object' do
    expect(built_user).to be_instance_of User
    expect(built_user).to have_attributes(name: 'Mateusz', age: 26)
  end
  
  it 'Properly registers default values' do
    define_not_user_factory
    expect(registry.registered_classes.keys).to include 'NotUser'
    expect(registry.registered_classes['NotUser'].attribute_names.keys).to include 'not_name'
    expect(registry.registered_classes['NotUser'].attribute_names['not_name']).to eq 'foobar1'
    expect(registry.registered_classes['NotUser'].attribute_names.keys).to include 'not_age'
    expect(registry.registered_classes['NotUser'].attribute_names['not_age']).to eq 2
  end

  it 'Properly builds an object with default values' do
    define_not_user_factory
    overriden_user = FactoryBoy.build(NotUser)
    expect(overriden_user).to have_attributes(not_name: 'foobar1', not_age: 2)
  end

  it 'Properly builds an object with overriden default values' do
    define_not_user_factory
    overriden_user = FactoryBoy.build(NotUser, not_name: 'Mateusz')
    expect(overriden_user).to have_attributes(not_name: 'Mateusz', not_age: 2)
  end

end
