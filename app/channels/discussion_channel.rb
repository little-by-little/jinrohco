class DiscussionChannel < ApplicationCable::Channel
  def subscribed
    stream_from "discussion_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # data['message'][0] == village_id
    # data['message'][1] == chat_body
    # current_user == ログインしているユーザーid
    ActionCable.server.broadcast 'discussion_channel', message: data['message']
    Chat.create!(user_id: current_user.id, village_id: data['message'][0], body: data['message'][1])
  end
end
