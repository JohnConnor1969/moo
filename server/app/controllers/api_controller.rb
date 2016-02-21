class ApiController < ApplicationController


  def reg
    Player.create(number: params[:number]).permit(:number)
    # redirect_to action: 'create' [:number => '8888']
    # render text: "wooooowooowowo парень, палехче"
  end

  def play
    @player = Player.where(number: params[:number]).first
    @chan = @player.channels.first.link
    render json: @chan
    # @player.channels.push Channel.where(:published =>  true).first
    # render text: "clannel 1 http://asdfkllllcllldf"
  end

  def next
    
  end

  def prev
    
  end
end