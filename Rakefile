require './app.rb'
require 'sinatra/activerecord/rake'

desc "check weather"
task :w do
    zipcode = ENV['ZIPCODE'] || 30043
    sh "weather #{zipcode}"
end

task:force

desc "create README.md"
file 'README.md' => :force do
  sh "echo 'README FILE.' >> README.md"
end

task:default => [ :w, 'README.md' ]