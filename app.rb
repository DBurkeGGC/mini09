require 'sinatra'
require 'uri'
require 'active_record'
set :public_folder, "public"

db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///mini09')

ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :username => db.user,
  :password => db.password,
  :database => db.path[1..-1],
  :encoding => 'utf8'
)

class Links < ActiveRecord::Base
  has_many :comments
end

class Comments < ActiveRecord::Base
  belongs_to :links
end

get '/' do
  erb :index
end

get '/list' do
  @links = Links.order("id ASC")
  @comments = Comments.order("id ASC")
  erb :list
end

get '/create' do
  erb :create
end

get '/about' do
  erb :about
end

get '/destroy' do
  Links.delete_all
  Comments.delete_all
  redirect to "/"
end

post '/create' do
  link = Links.new(params[:link])
  if link.save
    redirect to "/list"
  else
    return "failure!"
  end
end

post '/comment' do
  comment = Comments.new(params[:comment])
  if comment.save
    redirect to "/list"
  else
    return "failure!"
  end
end
