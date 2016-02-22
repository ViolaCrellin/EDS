
ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'JSON'
require_relative 'data_mapper_setup'


class EDS < Sinatra::Base

  get '/stats' do
    Stats.all.to_json
  end

  get '/stats/:id' do
    stat ||= Stats.get(params[:id]) || halt(404)
    format_response(stat, request.accept)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
