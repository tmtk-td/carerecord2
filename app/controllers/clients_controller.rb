class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  def index
    @clients = Client.all
  end
  def new
    @client = Client.new
  end
  def create
    @client = Client.new(client_params)
    if params[:back]
      render :new
    else
      if @client.save
        # new_client_pathというPrefixを書くことで、"/clients/new"というURLの指定をします、という意味になる。
        # 一覧画面へ遷移して”記録を作成しました！"とメッセージを表示します。
        redirect_to clients_path, notice: "作成しました！"
      else
        # 入力フォームを再描画します。
        render :new
      end
    end
  end
  def confirm
    @client = Client.new(client_params)
    render :new if @client.invalid?
  end 
  def show
    # @client = Client.find(params[:id]) 共通処理
  end
  def edit
    # @client = Client.find(params[:id]) 共通処理
  end
  def update
    # @client = Client.find(params[:id]) 共通処理
    if @client.update(client_params)
      redirect_to clients_path, notice: "編集しました！"
    else
      render :edit
    end
  end
  def destroy
    @client.destroy
    redirect_to clients_path, notice:"削除しました！"
  end
  private
  def client_params
    params.require(:client).permit(:name, :sex, :born_on, :age, :information, :image, :image_cache)
  end
  # idをキーとして値を取得するメソッドを追加
  def set_client
    @client = Client.find(params[:id])
  end
end
