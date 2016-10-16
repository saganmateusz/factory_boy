$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "factory_boy"
require 'models/user'
require 'models/not_user'

def define_not_user_factory
  FactoryBoy.define_factory(NotUser) do
    not_name 'foobar1'
    not_age 2
  end
end