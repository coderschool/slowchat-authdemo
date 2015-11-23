class MessagesController < ApplicationController

  before_action :require_login

  def index
    @messages = Message.where(recipient: current_user)      
  end
end
