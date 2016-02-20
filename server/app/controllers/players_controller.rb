class PlayersController < ApplicationController
  # before_filter :check_play, only [:play, :next, :prev]
  def index
    @players = Player.all
    # render text: "lalsldkkk sldkflla"
  end

  def new
    @player = Player.new

  end
  
  def reg
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
      render "new"
    end
    # render text: params.inspect
  end
  def show
    
  end

  private
    def check_play
      
    end
end
