# frozen_string_literal: true

class Fruit < ActiveRecord::Base
  validates :name, presence: true
end
