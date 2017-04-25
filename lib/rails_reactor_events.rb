require "active_record"

require "rails_reactor_events/version"
require "rails_reactor_events/app/models/event"

require "generators/rails_reactor_events/install/install_generator"

module RailsReactorEvents
  def self.log_event(entity:, action:, user: nil, message: nil, params: {})
    Event.log(
      entity: entity,
      action: action,
      user: user ? user : Thread.current[:current_user],
      params: entity.previous_changes.merge!(message: message).merge!(params)
    )
  end
end
