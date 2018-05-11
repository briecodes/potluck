class AnalyticsController < ApplicationController
  def index
    if current_user.username != "admin"
      redirect_to root_path
    end
  end
end
