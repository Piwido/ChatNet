class ChatroomController < ApplicationController 
    before_action :authenticate_user!, only: [:new]
    def index
        @messages = Message.all
        @new_message = Message.new

    end 

    def new 
    end 

    #def create 
    #    @message = Message.new(message_params)
    #    @message.user_id = current_user.id
    #    if @message.save
#
    #        ActionCable.server.broadcast "ChatroomChannel", foo: @message.body
    #    end 
    #end 
#
    def create
        @message = current_user.messages.build(message_params)  # This uses association build method
      
        if @message.save
          ActionCable.server.broadcast('ChatroomChannel',{ mod_message: message_render(@message)})
          #render json: { status: 'success', message: 'Message sent!' }, status: :ok
        else
          render json: @message.errors, status: :unprocessable_entity
        end
      end
      

    def delete
        @message = Message.find(params[:id])
        @message.destroy
        redirect_to root_path
    end



    private

    def message_render(message)
        render(partial: 'messages/message', locals: { message: message})
    end
    def message_params
        params.require(:message).permit(:body)
    end
end 

