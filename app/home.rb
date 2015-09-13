require 'sinatra/base'
require 'active_record'

class Home < Sinatra::Base
  get '/' do
    'hi'
  end
end
