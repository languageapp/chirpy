class ProfilesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @profiles = Profile.all
    if current_user
      if current_user.profile
        redirect_to profile_path(current_user.profile)
      else
        redirect_to new_profile_path
      end
    end
  end

  def new
    @profile = Profile.new
    @language = Language.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    @language = current_user.languages.build(language_params)
    if @profile.save && @language.save  
      flash[:notice] = 'Profile added successfully'
      redirect_to profile_path(@profile)
    else
      render 'new'
    end
  end

  def show
    @profile = current_user.profile
    @language = current_user.languages
  end  

  def edit
    @profile = current_user.profile
    @language = current_user.languages
  end

 def update
    @profile = current_user.profile
    @profile.update(profile_params)
    @language = current_user.languages
    @language.update_all(params.permit(:language_native, :language_target, :proficiency))
    redirect_to profile_path(@profile)
  end

  def language_params
    params.require(:language).permit(:language_native, :language_target,)
  end  

  def profile_params
    params.require(:profile).permit(:name, :image, :age, :bio, :gender)
  end  

end


