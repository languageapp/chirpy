class OnlineController < ApplicationController

  @@users_online ||= [];
  @@timeout_hash ||= {};

  def poll
    if params[:profile_id] == "undefined"
      render json: {}
      return
    end
    addOnlineUser(params[:profile_id])
    checkLogout
    render json: {users: @@users_online}
  end

  def checkLogout
    timed_out = [];
    @@timeout_hash.each do |key, value|
      if (Time.now - value) > 6
        timed_out << key
      end
    end
    timed_out.each do |key|
      @@timeout_hash.delete(key)
      @@users_online.delete(key.to_s.to_i)
    end
  end

  def addOnlineUser(user_id)
    @@users_online << user_id.to_i if !@@users_online.include? user_id.to_i
    @@timeout_hash[user_id.to_sym] = Time.now
  end
end