class WelcomeController < ApplicationController
  def index
    require 'indico'
    Indico.api_key = "bc5a4dd18dd9575c7a29b61a291df552"
    
    @tweets = current_user.twitter.home_timeline(:page => 1, :count => 50)
    @tweetstext = []
  end
end
