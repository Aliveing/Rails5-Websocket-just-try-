class ChatController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token, :only => [:create]
  def root
    redirect_to '/main/index'
  end

  def create
    # App.chat.speak(params)
    puts params.to_json
    # Message.create(content:params[:content],name:params[:name])
    # ActionCable.server.broadcast 'chat_channel', message:params[:content]
    render :text => {success:true}.to_json, :layout => false
  end

  def get_all
    # logger.info "xxx"
    # logger.info ActionCable.server.channel_classes
    # logger.info "xxx"
    json = {
        success:true,
        data: Message.all
    }
    render :plain => json.to_json, :layout => false
  end


  def self.update_status
    puts('xxxxxxxxxxxxxxx1')
    puts('xxxxxxxxxxxxxxx2')
    msg = {
        content:"123",
        refresh:true
    }
    ActionCable.server.broadcast 'ChatChannel', message:msg
  end

end
