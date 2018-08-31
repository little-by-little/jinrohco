class DiscussionChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "discussion_channel"
    stream_from "discussion_channel_#{current_user.current_village}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    chat_body = data['message']
    chat = Chat.create!(
      user_id: current_user.id,
      village_id: current_user.current_village,
      body: chat_body
      )
    ActionCable.server.broadcast "discussion_channel_#{current_user.current_village}", {
      speaker: current_user.id,
      body: chat_body,
      v_id: data['v_id']
    }
    # DiscussionChannel.broadcast_to(current_user.current_village, {speaker: current_user.id, body: data})
  end
end
