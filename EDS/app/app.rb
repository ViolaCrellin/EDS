
ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'JSON'
require_relative 'data_mapper_setup'


class EDS < Sinatra::Base

  get '/stats' do
    Stats.all.to_json
  end


  get "/stats/search_key_value/*" do
    key_value_array = params['splat'].first.split("/")
    field = key_value_array.first.to_sym
    value = key_value_array.last
      if ["id", "year"].include?(field)
        value.to_i
      elsif field == :gov
        value
      else
        value.to_f
      end
    search_result = Stats.all(field => value)|| halt(404)
    search_result.to_json
  end

  get "/stats/search_key/*" do
    key_value_array = params['splat'].first.split("/")
    field = key_value_array.first.to_sym
  require 'pry'; binding.pry
    search_result = Stats[field]|| halt(404)
    search_result.to_json
  end



  # start the server if ruby file executed directly
  run! if app_file == $0

end
