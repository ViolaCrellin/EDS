require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/stats'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/eds_api_#{ENV['RACK_ENV']}")
DataMapper.finalize
