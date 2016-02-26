require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/stats'
require_relative 'models/debt'
require_relative 'models/household'
require_relative 'models/unemployment'
require_relative 'models/macrostat'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/eds_api_#{ENV['RACK_ENV']}")
DataMapper.finalize
