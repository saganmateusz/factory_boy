require "spec_helper"

describe User do
  it "initializes properly" do
    expect(User.new(name: 'foobar', age: 17)).to have_attributes(name: 'foobar', age: 17)
  end

end
