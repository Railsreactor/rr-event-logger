require "spec_helper"
require 'byebug'

require 'test_app/test_module'

RSpec.describe RailsReactorEvents do
  it "has a version number" do
    expect(RailsReactorEvents::VERSION).not_to be nil
  end

  it "does something useful" do
    fruit = Fruit.create(name: 'banana', price: 100)
    fruit_log = described_class.log_event(entity: fruit, action: "created")
    expect(fruit_log.entity_type).to eq fruit.class.name
    expect(fruit_log.entity_id).to eq fruit.id
    expect(fruit_log.action).to eq 'fruit.created'
  end
end
