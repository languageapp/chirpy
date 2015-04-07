class ProfilesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  
  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end
  
  def create
    @profile = Profile.create(options = {:name => profile_params[:name], :user => current_user} )
    if @restaurant.save  
      flash[:notice] = 'Profile added successfully'
      redirect_to restaurants_path
    else
      render 'new'
    end    
  end

  def restaurant_params
    params.require(:profile).permit(:name, :image)
  end  

  def show
    @profile = Profile.find(params[:id])
  end  

  def edit
    @profile = Profile.find(params[:id])
  end

end
