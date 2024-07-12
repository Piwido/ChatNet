class ChatroomController < ApplicationController 
    before_action :authenticate_user!, only: [:new]
    def index
        @messages = Message.all
        @new_message = Message.new

    end 

    def new 
    end 

    def create 
        @message = Message.new(message_params)
        @message.user_id = current_user.id
        respond_to do |format|
            if @message.save
                format.html { redirect_to root_path, notice: 'Message was successfully created.' }
                format.js

            else 
                format.html { render :new }
                format.json { render json: @message.errors, status: :unprocessable_entity }
            end
        end 


    end 

    def delete
        @message = Message.find(params[:id])
        @message.destroy
        redirect_to root_path
    end



    private
    def message_params
        params.require(:message).permit(:body)
    end
end 

