require 'sinatra/base'
require 'active_record'
require 'mysql2'
require_relative 'models/cpu_temp'

# DB設定ファイルの読み込み
ActiveRecord::Base.configurations = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection(:development)

class Home < Sinatra::Base
  get '/' do
    content_type :json, :charset => 'utf-8'
    cpu_temp = CpuTemp.order("id DESC").limit(10)
    cpu_temp.to_json()
  end

  post '/' do
    # データ保存
    cpu_temp = CpuTemp.new
    cpu_temp.temp = 40
    cpu_temp.save

    # レスポンスコード
    status 202
  end

end
