class ProfilesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  
  def index
    @profiles = Profile.all
    if current_user
      redirect_to new_profile_path
    end      
  end

  def new
    @profile = Profile.new
  end
  
  def create
    @profile = Profile.create(options = {:name => profile_params[:name], :user => current_user} )
    if @profile.save  
      flash[:notice] = 'Profile added successfully'
      redirect_to profiles_path
    else
      render 'new'
    end    
  end

  def profile_params
    params.require(:profile).permit(:name, :image)
  end  

  def show
    @profile = Profile.find(params[:id])
  end  

  def edit
    @profile = Profile.find(params[:id])
  end

end
