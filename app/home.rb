require 'sinatra/base'
require 'active_record'
require 'mysql2'
require_relative 'models/cpu_temp'

# DB設定ファイルの読み込み
ActiveRecord::Base.configurations = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection(:development)

class Home < Sinatra::Base

  get '/' do
      erb :index
  end

  get '/cpu_temp' do
    content_type :json, :charset => 'utf-8'
    cpu_temp = CpuTemp.order("id DESC").limit(10)
    cpu_temp.to_json()
  end

  #post '/cpu_temp' do
  #  # データ保存
  #  cpu_temp = CpuTemp.new
  #  cpu_temp.temp = params[:temp]
  #  cpu_temp.save

  #  # レスポンスコード
  #  status 202
  #end

end
