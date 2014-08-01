env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative 'peep'
require_relative 'user'

DataMapper.finalize

DataMapper.auto_upgrade!