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
    FactoryBoy.define_factory(NotUser) do 
      not_name 'foobar'
      not_age 1
    end
    built_not_user = FactoryBoy.build(NotUser)
    expect(built_not_user).to have_attributes(not_name: 'foobar', not_age: 1)
    overriden_not_user = FactoryBoy.build(NotUser, not_name: 'Mateusz', not_age: 26)
    expect(overriden_not_user).to have_attributes(not_name: 'Mateusz', not_age: 26)
  end
  
  
end
