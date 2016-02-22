class ApiController < ApplicationController
  before_filter :find_player,      only: [:_play, :_next, :_prev, :_reg]

  def _reg
    unless @player
      @player = Player.create(number: params[:number])
      unless Channel.where(:published =>  true).empty?
        @player.channels << Channel.where(:published =>  true).first
      end
      render json: @player
    else
      render nothing: true
    end
  end

  def _play
    @chan = @player.channels.first
    render json: @chan
  end

  def _next
    cur_chan = @player.channels.first.id
    unless Channel.where(:published =>  true).where("id > ?", cur_chan).empty?
      @player.channels.clear
      @player.channels << Channel.where(:published =>  true).where("id > ?", cur_chan).first
    end
    @chan = @player.channels.first
    render json: @chan
  end

  def _prev
    cur_chan = @player.channels.first.id
    unless Channel.where(:published =>  true).where("id < ?", cur_chan).empty?
      @player.channels.clear
      @player.channels << Channel.where(:published =>  true).where("id < ?", cur_chan).last
    end
    @chan = @player.channels.first
    render json: @chan
  end

  private
    def find_player
    @player = Player.where(number: params[:number]).first
    end

end