class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @sent_messages = Message.all.where(client_id: current_client.id)
    @receive_messages = Message.receive_messages(current_client.id)
  end


  def new
    @all_users = (Client.with_role :user).where.not(id:current_client.id)
    @all_trainers =  (Client.with_role :trainer).where.not(id:current_client.id)
    # @all_clients = Client.where.not(id: current_client.id)
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @all_users = (Client.with_role :user).where.not(id:current_client.id)
    @all_trainers =  (Client.with_role :trainer).where.not(id:current_client.id)

    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path, notice: 'Message was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def home
  end


  private

    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:client_id, :message, :receiver_ids => [])
    end
end
