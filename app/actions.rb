# Homepage (Root path)
enable :sessions

get '/' do
  erb :index
end

get '/' do
  title = params[:username]
  @username = request.cookies[:username]
  erb :index
end

get '/:profile/songs' do
  return "#{params[:username]}'s music wall"
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/albums' do
  @albums = Album.all
  erb :'albums/index'
end

get '/songs/new' do
  erb :'songs/new'
end

get '/songs/:name' do 
  @song = Song.find params[:name]
   erb :'songs/show'
 end

post '/login' do
  @user = User.where(
    email: params[:email],
    password: params[:password]
    )[0]
  if @user.nil?
    @error_message = "password or email incorrect"
    erb :index
  else
    session[:key] = @user.rand_key
  erb '/:profile/songs'
end
end

get '/logout' do
  session.clear
  redirect :'/'
end
# post '/new_acount'
#   session[:username] = params[:username]
#   erb :'/new_account'
# end

 post '/songs' do
  @song = Song.new(
    name: params[:name],
    artist: params[:artist],
    album_id: params[:album_id]
    )
  if @song.save  
   redirect '/songs'
 else
   @error = "please enter all fields"
    erb :'songs/new'
  end
end