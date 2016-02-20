class Channel < ActiveRecord::Base
  has_and_belongs_to_many :players
  private
    def channel_params
      params.require(:Channel).permit(:name, :link, :published)
    end
end
