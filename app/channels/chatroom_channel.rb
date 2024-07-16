class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "ChatroomChannel"
    ActionCable.server.broadcast("ChatroomChannel",)

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

    def send_message(data)
    message = Message.create(user_id: current_user.id, body: data['body'])
    if message.save
      ActionCable.server.broadcast "ChatroomChannel", message: render_message(message)
    end
  end



end
