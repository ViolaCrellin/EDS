require 'data_mapper'
require 'dm-postgres-adapter'
require './models/data'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/eds_api_#{ENV['RACK_ENV']}")
DataMapper.finalize
