class ApiController < ApplicationController
  before_filter :find_player,      only: [:_play, :_next, :_prev, :_answer]

  def _reg
    Player.create(number: params[:number]).permit(:number)
    # redirect_to action: 'create' [:number => '8888']
    # render text: "wooooowooowowo парень, палехче"
  end

  def _play
    @chan = @player.channels.first.link
    render json: @chan
  end

  def _next
    i = @player.channels.first.id
    unless Channel.where(:published =>  true).where("id > 'i'").empty?
      @player.channels.clear
      @player.channels << Channel.where(:published =>  true).where("id > 'i'").first
    end
    @chan = @player.channels.first.link
    render json: @chan
  end

  def _prev
    i = @player.channels.first.id
    unless Channel.where(:published =>  true).where("id < 'i'").empty?
      @player.channels.clear
      @player.channels << Channel.where(:published =>  true).where("id < 'i'").first
    end
    @chan = @player.channels.first.link
    render json: @chan
  end

  def _answer
    # @chan = @player.channels.first.link
    # render json: @chan
  end

  def fix
    @player.channels.clear
    unless Channel.where(:published =>  true).empty?
      @player.channels << [Channel.where(:published =>  true).first]
    end

    redirect_to player_path(@player)
  end

  private
    def find_player
    @player = Player.where(number: params[:number]).first
    # render_404 unless @player
    end

end