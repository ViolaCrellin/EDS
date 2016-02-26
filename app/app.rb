
ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'JSON'
require_relative 'data_mapper_setup'


class EDS < Sinatra::Base
  enable :sessions

  get '/' do
    send_file 'eds.html'
  end

  get '/stats' do
    start = params[:start]
    finish = params[:finish]
    Stats.all(:year => (start.to_i..finish.to_i)).to_json
  end

  get '/gov' do
    start = params[:start]
    finish = params[:finish]
    party = params[:party]
    Stats.all(:gov => party.capitalize).to_json
  end

  run! if app_file == $0

end
