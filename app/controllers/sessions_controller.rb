class SessionsController < ApplicationController
  def create
    require 'securerandom'
    rs = SecureRandom.urlsafe_base64
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    redirect_to root_path(:sid => rs)
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end