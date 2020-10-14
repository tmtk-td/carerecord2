class CareRecordsController < ApplicationController
  before_action :set_care_record, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @care_records = CareRecord.where(client_id: params[:client_id]).order(content_date: "desc").page(params[:page]).per(10)
  end
  def new
    @care_record = CareRecord.new
    @care_record.client_id = params[:client_id]
  end
  def create
    @care_record = CareRecord.new(care_record_params)
    if @care_record.save
      # 一覧画面へ遷移して"作成しました！"とメッセージを表示します。
      redirect_to care_records_path(client_id: params[:care_record][:client_id]), notice: "記録作成しました！"
    else
      # 入力フォームを再描画します。
      render :new
    end
  end
  def show
    # @care_record = CareRecord.find(params[:id]) 共通処理
    @comments = @care_record.comments
    @comment = @care_record.comments.build
  end
  def edit
    # @care_record = CareRecord.find(params[:id]) 共通処理
  end
  def update
    # @care_record = CareRecord.find(params[:id]) 共通処理
    if @care_record.update(care_record_params)
      session[:client_id] = @care_record.client_id
      redirect_to care_records_path(client_id: params[:care_record][:client_id]), notice: "編集しました！"
    else
      render :edit
    end
  end
  def destroy
    @care_record.destroy
    redirect_to care_records_path(client_id: params[:care_record][:client_id]), notice:"記録を削除しました！"
  end
  private
  def care_record_params
    params.require(:care_record).permit(:content, :client_id, :content_date, label_ids: [])
  end
  # idをキーとして値を取得するメソッドを追加
  def set_care_record
    @care_record = CareRecord.find(params[:id])
  end
end
