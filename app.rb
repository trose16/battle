require 'sinatra/base'
require_relative './lib/player.rb'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/play' do
    erb :play
  end

  post '/battle-names' do
    $player_1 = Player.new(params[:player_1])
    $player_2 = Player.new(params[:player_2])
    # @player_1 = params[:player_1]
    # @player_2 = params[:player_2]
    redirect '/play'
  end

  get '/attack' do
    erb :attack
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
