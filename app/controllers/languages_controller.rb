class LanguagesController < ApplicationController


def new
  @language = Language.new
end

def index
  # @languages = Language.all
end

def create
  @language = Language.new(language_params)
    
  if @language.save  
    flash[:notice] = 'Language added successfully'
    render 'show'
  end
end


def language_params
    params.require(:language).permit(:language_name, :proficiency)
end  


end
