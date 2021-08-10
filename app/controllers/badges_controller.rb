class BadgesController < ApplicationController
  before_action :set_badge, only: %i[show]

  def index
    @badges = Badge.all
    @user_badges = current_user.badges
  end

  def show
  end

  private
    def set_badge
      @badge = Badge.find(params[:id])
    end

    def badge_params
      params.require(:badge).permit(:name, :image, :url)
    end
end
