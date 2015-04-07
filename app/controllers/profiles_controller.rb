class ProfilesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  
  def index
    @profiles = Profile.all
  end
end
