module RailsReactorEvents
  class Event < ActiveRecord::Base
    belongs_to :user
    belongs_to :entity, polymorphic: true

    validates :entity, :entity_type, :entity_id, :action, presence: true

    def self.log(entity:, action:, user: nil, params: {})
      params = {
        entity: entity,
        action: "#{entity.class.name.underscore}.#{action}",
        params: params
      }
      params[:user] = user if user
      create!(params)
    end
  end
end
