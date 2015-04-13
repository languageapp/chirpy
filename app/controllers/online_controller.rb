class OnlineController < ApplicationController

  @@users_online ||= [];

  def poll

    @@users_online << params[:profile_id] if !@@users_online.include? params[:profile_id]
    @users_online = @@users_online

  end


end
