require 'rails/generators'
require 'rails/generators/base'
require 'rails/generators/migration'

module RailsReactorEvents
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      desc 'Add the migration for events creating'

      def self.next_migration_number(path)
        if ActiveRecord::Base.timestamped_migrations
          next_migration_number = Time.new.utc.strftime('%Y%m%d%H%M%S')
        else
          next_migration_number = '%.3d' % (current_migration_number(dirname) + 1)
        end
        ActiveRecord::Migration.next_migration_number(next_migration_number)
      end

      def copy_migrations
        migration_template 'create_events.rb', 'db/migrate/create_events.rb'
      end
    end
  end
end
