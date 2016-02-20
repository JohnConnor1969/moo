class ChannelsController < ApplicationController
  before_filter :find_channel,      only: [:show, :edit, :update, :destroy, :uppublish]
  # before_filter :check_if_admin, only: [:edit, :update, :new, :create, :destroy]

  def index
    @channels = Channel.all
    # render text: "lalsldkkk sldkflla"
  end
  def published
    @channels = Channel.where(:published =>  true)
    render "index"
  end
  #/channelsT
  def show
    unless @channel #= Channel.where(id: params[:id]).first
      render text: "Page not found", status: 404
    end
  end
  #/channels/new GET
  def new
    @channel = Channel.new
  end
  #/channels/1/edit GET
  def edit
    # @channel = Channel.find(params[:id])
  end
  #/channels POST
  def create
    # channel_params = (params[:channel])
    @channel = Channel.create((params[:channel]).permit(:name, :link, :published))
    # @channel = Channel.create(params[:channel])
    if @channel.errors.empty?
      redirect_to channel_path(@channel)
    else
      render "new"
    end
    # render text: params.inspect
  end
  #/channels/1 PUT
  def update
    # @channel = Channel.find(params[:id])
    @channel.update_attributes((params[:channel]).permit(:name, :link, :published))
    if @channel.errors.empty?
      redirect_to channel_path(@channel)
    else
      render "edit"
    end
  end
  #/channels/1 DELETE
  def destroy
    # @channel = Channel.find(params[:id])
    @channel.destroy
    redirect_to action: "index"
  end
  def uppublish
    @channel.toggle!(:published)
    redirect_to action: :index
  end
  private
    def find_channel
      # @channel = Channel.find(params[:id])
      @channel = Channel.where(id: params[:id]).first
      render_404 unless @channel
    end



  # private
    # def channel_params
      # params.require(:channel).permit(:name, :link)
    # end
  end