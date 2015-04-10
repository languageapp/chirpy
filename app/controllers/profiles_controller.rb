class ProfilesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index

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
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      flash[:notice] = 'Profile added successfully'
      redirect_to profile_path(@profile)
    else
      render 'new'
    end
  end

  def profile_params
    params.require(:profile).permit(:name, :image, :age, :bio, :gender)
  end

  def show
    @conversations = Conversation.involving(current_user).order("created_at DESC")
    @users = User.where.not("id = ?",current_user.id).order("created_at DESC")
    @profile = current_user.profile
    @my_id = @profile.id
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    @profile.update(profile_params)
    redirect_to profile_path(@profile)
  end

end
