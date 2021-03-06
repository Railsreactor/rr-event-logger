# frozen_string_literal: true

require 'generator_spec'
require 'generators/rails_reactor_events/install/install_generator'

module RailsReactorEvents
  module Generators
    describe InstallGenerator, type: :generator do
      root_dir = File.expand_path('../../../../../../tmp', __FILE__)
      destination root_dir

      before :all do
        prepare_destination
        run_generator
      end

      it 'creates the installation db migration' do
        migration_file =
          Dir.glob("#{root_dir}/db/migrate/*create_events.rb")

        assert_file migration_file[0],
          /class CreateEvents < ActiveRecord::Migration/
      end
    end
  end
end
