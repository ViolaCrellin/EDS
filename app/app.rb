
ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'JSON'
require_relative 'data_mapper_setup'


class EDS < Sinatra::Base
  enable :sessions

  get '/' do
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
    if start.nil? || finish.nil?
      party_stats = Stats.all(:gov => party.capitalize)
      party_stats.to_json
    else
      party_stats.all(:year => (start.to_i..finish.to_i)).to_json
    end
  end

  get '/debt' do
    # start = params[:start]
    # finish = params[:finish]
    Stats.get("net_national_debt_billions").to_json
    # year_selection.net_national_debt_billions.to_json
  end


  run! if app_file == $0

end
