class MessageChannel < ApplicationCable::Channel
  # チャンネル接続時に呼ばれる
  def subscribed
    stream_from "message_channel"
  end

  # メッセージをブロードキャストするためのアクション
  def speak(data)
    ActionCable.server.broadcast 'message_channel', message: data['message']
  end
end