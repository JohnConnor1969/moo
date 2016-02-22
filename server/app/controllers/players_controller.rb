class PlayersController < AdminsController
  before_filter :find_player,      only: [:show, :edit, :update, :destroy, :fix]

  def index
    @players = Player.all
  end

  def new
    @player = Player.new

  end
  

  def fix
    @player.channels.clear
    unless Channel.where(:published =>  true).empty?
      @player.channels << [Channel.where(:published =>  true).first]
    end

    redirect_to player_path(@player)
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
  end
  def destroy
    @player.destroy
    redirect_to action: "index"
  end
  def show
    unless @player
      render text: "Page not found", status: 404
    end
  end

  private
    def find_player
    @player = Player.where(id: params[:id]).first
    render_404 unless @player
    end
end
