
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
    Stats.all.to_json
  end

  post '/stats/years/range' do
    start = params[:start]
    finish = params[:finish]
    stats = Stats.get(:year => (1999..2015))
    session[:selection] = stats
    redirect '/stats/years'
  end

  get '/stats/years' do
    # Stats.get(:year => '1999').to_json
    session[:selection].to_json
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
