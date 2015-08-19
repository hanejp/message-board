class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update]
  def index
        # Messageを全て取得する。
    @messages = Message.all
    @message = Message.new
  end
  ## ここから追記　8.4 編集・更新処理の開発
def edit
  end
  
  def update
    if @message.update(message_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'メッセージを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
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
  ## ここから追記　8.4 編集・更新処理の開発
  def set_message
    @message = Message.find(params[:id])
  end
end
