# Super simple http server
require 'sinatra'
require_relative 'kraken'

set :raise_errors, true
set :show_exceptions, false

post '/api/v1/upload' do
  payload = JSON.parse request.body.read
  Kraken.upload(payload['artifact'], Time.now)
end
