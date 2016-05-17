# Homepage (Root path)
get '/' do
  erb :index
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

 post '/songs' do
  @song = Song.new(
    name: params[:name],
    artist: params[:artist],
    likes: params[:likes]
    )
  @song.save  
  redirect '/songs'
end