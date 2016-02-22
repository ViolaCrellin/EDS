
ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'JSON'
require_relative 'data_mapper_setup'


class EDS < Sinatra::Base

  get '/' do
    Data.all.to_json
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
