
ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'json'
require_relative 'data_mapper_setup'


class EDS < Sinatra::Base
  enable :sessions
  set :root, File.dirname(__FILE__)

  get '/' do
    erb :eds
  end

  get '/stats' do
    years = filter_year(params[:start], params[:finish])
    return status 404 if years.nil?
    # years.to_json
    content_type :json
    callback = params.delete('callback') # jsonp
    json = years.to_json
    if callback
      content_type :js
      response = "#{callback}(#{json})"
    else
      content_type :json
      response = json
    end
    response = json
    erb :eds
  end

  get '/gov' do
    start = params[:start]
    finish = params[:finish]
    party = params[:party]
    if start.nil? || finish.nil?
      party_stats = Stats.all(:gov => party.capitalize)
      party_stats.to_json
    else
      party_stats.all(:year => (start.to_i..finish.to_i)).to_json
    end
    erb :eds
  end

  get '/debt' do
    filter_year(params[:start], params[:finish]).debt.to_json
    erb :eds
  end

  get '/household' do
    filter_year(params[:start], params[:finish]).household.to_json
    erb :eds
  end

  get '/unemployment' do
      filter_year(params[:start], params[:finish]).unemployment.to_json
  end

  get '/unemployment/rate' do
      year_selection = filter_year(params[:start], params[:finish]).unemployment
      year_selection.all(:unemployment_rate.gt => params[:rate].to_i).to_json
  end

  get '/unemployment/raw_thousands' do
      year_selection = filter_year(params[:start], params[:finish]).unemployment
      year_selection.all(:unemployment_thousands.gt => params[:raw_thousands].to_i).to_json
  end

  get '/macrostat/inflation' do
    filter_year(params[:start], params[:finish]).macrostat.to_json
  end

  helpers do
    def filter_year(start, finish)
      start = "1948" if start.nil?
      finish = "2015" if finish.nil?
      Stats.all(:year => (start.to_i..finish.to_i))
    end
  end

  run! if app_file == $0

end
