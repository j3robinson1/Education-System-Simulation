class TimelineController < ApplicationController
  def index
    @users = User.all
  end
end
