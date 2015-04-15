class ProfilesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  helper ProfilesHelper

  def index
    if current_user
      if current_user.profile
        user_lang = current_user.languages[0]
        user_lang_native = current_user.languages[0].language_native
        formatted_locale = user_lang.format_to_locale(user_lang_native)
        I18n.locale = formatted_locale
        redirect_to profile_path(current_user.profile)
      else
        redirect_to new_profile_path
      end
    end
  end

  def new
    @profile = Profile.new
    @language = Language.new
    @language.language_native = I18n.locale
    lang = @language.language_native
    @lang_native = @language.format_from_locale(lang)
    langArray = ['English', 'French', 'German', 'Italian', 'Spanish']
    langArray.delete(@lang_native)
    @languagesArray = langArray
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
    @conversations = Conversation.involving(current_user).order("created_at DESC")
    @users = User.where.not("user_id = ?",current_user.id).with_profile
    @language = current_user.languages
    @profiles = Profile.all
    @profile = @profiles.find(params[:id])
    @my_id = current_user.profile.id
  end

  def edit
    @profile = current_user.profile
    @language = current_user.languages
    langArray = ['English', 'French', 'German', 'Italian', 'Spanish']
    langArray.delete(current_user.languages[0].language_native)
    @languagesArray = langArray

  end

 def update
    @profile = current_user.profile
    @profile.update(profile_params)
    @language = current_user.languages
    @language.update_all(params.permit(:language_native, :language_target, :proficiency))
    redirect_to profile_path(@profile)
  end

  def language_params
    params.require(:language).permit(:language_native, :language_target,:proficiency)
  end

  def profile_params
    params.require(:profile).permit(:name, :image, :age, :bio, :gender)
  end

end


