class PlayersController < ApplicationController
  # before_filter :check_play, only [:play, :next, :prev]
  before_filter :find_player,      only: [:show, :edit, :update, :destroy, :play, :fix, :next, :prev]
  def index
    @players = Player.all
    # render text: "lalsldkkk sldkflla"
  end

  def new
    @player = Player.new

  end
  
  def reg
    Player.create(number: params[:number]).permit(:number)
    # redirect_to action: 'create' [:number => '8888']
    # render text: "wooooowooowowo парень, палехче"
  end
  def fix
    @player.channels.clear
    @player.channels << [Channel.where(:published =>  true).first]
    redirect_to player_path(@player)
  end

  def play
    @player.channels.push Channel.where(:published =>  true).first
    render text: "clannel 1 http://asdfkllllcllldf"
  end

  def next
    
  end

  def prev
    
  end
  def update
    @player.update_attributes((params[:player]).permit(:number, :channels))
    if @player.errors.empty?
      redirect_to player_path(@player)
    else
      render "edit"
    end
  end

  def create
    @player = Player.create((params[:player]).permit(:number, :channels))
    
    if @player.errors.empty?
      redirect_to players_path
    else
      render "new"
    end
    # render text: params.inspect
  end
  def destroy
    @player.destroy
    redirect_to action: "index"
  end
  def show
    # render :json => @player
    unless @player #= player.where(id: params[:id]).first
      render text: "Page not found", status: 404
    end
  end

  private
    def find_player
    @player = Player.where(id: params[:id]).first
    render_404 unless @player
    end
end
