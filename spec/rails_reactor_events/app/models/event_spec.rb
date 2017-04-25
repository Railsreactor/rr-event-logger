# frozen_string_literal: true

require 'spec_helper'
require 'test_app/models/fruit.rb'

module RailsReactorEvents
  describe Event do
    describe 'log' do
      it 'creates new log entry' do
        fruit = Fruit.create(name: 'banana', price: 100)
        fruit_log = Event.log(entity: fruit, action: 'created')

        expect(fruit_log.entity_type).to eq fruit.class.name
        expect(fruit_log.entity_id).to eq fruit.id
        expect(fruit_log.action).to eq 'fruit.created'
      end
    end
  end
end
