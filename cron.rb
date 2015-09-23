#!/usr/bin/env ruby
require 'active_record'
require 'mysql2'

# DB$B@_Dj%U%!%$%k$NFI$_9~$_(B
ActiveRecord::Base.configurations = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection(:development)

class CpuTemp < ActiveRecord::Base
  self.default_timezone = :local
  self.table_name = "cpu_temp"
end

# $B%G!<%?J]B8(B
t = `cat /sys/class/thermal/thermal_zone0/temp`
cpu_temp = CpuTemp.new
cpu_temp.temp = t.to_i.quo(1000)
cpu_temp.save
