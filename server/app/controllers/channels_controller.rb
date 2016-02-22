class ChannelsController < AdminsController
  before_filter :find_channel,      only: [:show, :edit, :update, :destroy, :uppublish]

  def index
    @channels = Channel.all
  end

  def published
    @channels = Channel.where(:published =>  true)
    render "index"
  end
  #/channelsT
  def show
    unless @channel
      render text: "Page not found", status: 404
    end
  end
  #/channels/new GET
  def new
    @channel = Channel.new
  end
  #/channels/1/edit GET
  def edit
  end
  #/channels POST
  def create
    @channel = Channel.create((params[:channel]).permit(:name, :link, :published, :players))
    if @channel.errors.empty?
      redirect_to channel_path(@channel)
    else
      render "new"
    end
  end
  #/channels/1 PUT
  def update
    @channel.update_attributes((params[:channel]).permit(:name, :link, :published, :players))
    if @channel.errors.empty?
      redirect_to channel_path(@channel)
    else
      render "edit"
    end
  end
  #/channels/1 DELETE
  def destroy
    @channel.destroy
    redirect_to action: "index"
  end
  def uppublish
    @channel.toggle!(:published)
    redirect_to action: :index
  end
  private
    def find_channel
      @channel = Channel.where(id: params[:id]).first
      render_404 unless @channel
    end

  # private
    # def channel_params
      # params.require(:channel).permit(:name, :link)
    # end
  end