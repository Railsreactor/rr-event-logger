# frozen_string_literal: true

# loading structure for tests

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host:    ENV['DATABASE_HOST'],
  username: ENV['DATABASE_USERNAME'],
  password: ENV['DATABASE_PASSWORD'],
  database: ENV['DATABASE_NAME'],
  pool: 50
)

tables = ActiveRecord::Base.connection.execute('select tablename from pg_tables').to_a.map { |t| t['tablename'] }
tables.each do |table|
  unless table.index('pg_') == 0 || table.index('sql_') == 0
    ActiveRecord::Base.connection.execute("drop table if exists \"#{table}\" cascade")
  end
end

ActiveRecord::Base.connection.execute(File.read(File.join(File.dirname(__FILE__), '../fixtures/structure.sql')))
