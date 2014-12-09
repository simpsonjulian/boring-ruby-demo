# Depends on a database
# Tests the happy path

require 'rubygems'
require 'json'
require 'rack/test'
require 'spec_helper'

require_relative '../app'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe "app", "json" do
  it "handles a payload" do
    post '/api/v1/upload', {artifact: 'doodoo.tar.gz'}.to_json
    expect(last_response).to be_ok
  end
end

