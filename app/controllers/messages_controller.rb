class MessagesController < ApplicationController
  def index
        # Messageを全て取得する。
    @messages = Message.all
    @message = Message.new
  end

  ## ここから追記
  def create
    @message = Message.new(message_params)
    if @message.save
    redirect_to root_path , notice: 'メッセージを保存しました'
  else
    #保存できなかったとき
    @messages = Message.all
    flash.now[:alert] = "メッセージの保存に失敗したよ"
    render 'index'
  end
  end

  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
  ## ここまで
end