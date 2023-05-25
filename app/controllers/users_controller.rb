class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.first
  end
end
