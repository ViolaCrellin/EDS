
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

  # post '/stats' do
  #   start = params[:start]
  #   finish = params[:finish]
  #
  #   @stats = [start.to_i, finish.to_i]
  #   # Stats.get(:year => (start.to_i..finish.to_i))
  #   session[:selection] = @stats
  #   redirect '/'
  # end

  # get 'stats/search' do
  #   'hello world'
  # end

  # get 'stats/result' do
  #   content_type :json
  #   session[:selection].to_json
  #   # send_file 'eds.html'
  # end

  # get '/stats/years' do
  #   # Stats.get(:year => '1999').to_json
  #   session[:selection].to_json
  # end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
