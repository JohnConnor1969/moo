class PlayersController < ApplicationController
  # before_filter :check_play, only [:play, :next, :prev]
  before_filter :find_player,      only: [:show, :edit, :update, :destroy]
  def index
    @players = Player.all
    # render text: "lalsldkkk sldkflla"
  end

  def new
    @player = Player.new

  end
  
  def reg
    # redirect_to action: 'create' [:number => '8888']
    render text: "wooooowooowowo парень, палехче"
  end

  def play
    
  end

  def next
    
  end

  def prev
    
  end

  def create
    @player = Player.create((params[:player]).permit(:number))
    if @player.errors.empty?
      redirect_to players_path
    else
      render text: "nope"
    end
    # render text: params.inspect
  end
  def destroy
    @player.destroy
    redirect_to action: "index"
  end
  def show
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
