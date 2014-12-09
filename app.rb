require 'sinatra'

set :raise_errors, true
set :show_exceptions, false

post '/api/v1/upload' do
  puts JSON.parse request.body.read
end
