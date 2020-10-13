class CareRecordsController < ApplicationController
  before_action :set_care_record, only: [:show, :edit, :update, :destroy]
  def index
    @care_records = CareRecord.all
  end
  def new
    @care_record = CareRecord.new
  end
  def create
    @care_record = CareRecord.new(care_record_params)
    if params[:back]
      render :new
    else
      if @care_record.save
        # new_care_record_pathというPrefixを書くことで、"/care_records/new"というURLの指定をします、という意味になる。
        # 一覧画面へ遷移して”記録を作成しました！"とメッセージを表示します。
        redirect_to care_records_path, notice: "記録を作成しました！"
      else
        # 入力フォームを再描画します。
        render :new
      end
    end
  end
  def confirm
    @care_record = CareRecord.new(care_record_params)
    render :new if @care_record.invalid?
  end 
  def show
    # @care_record = CareRecord.find(params[:id]) 共通処理
  end
  def edit
    # @care_record = CareRecord.find(params[:id]) 共通処理
  end
  def update
    # @care_record = CareRecord.find(params[:id]) 共通処理
    if @care_record.update(care_record_params)
      redirect_to care_records_path, notice: "編集しました！"
    else
      render :edit
    end
  end
  def destroy
    @care_record.destroy
    redirect_to care_records_path, notice:"記録を削除しました！"
  end
  private
  def care_record_params
    params.require(:care_record).permit(:content)
  end
  # idをキーとして値を取得するメソッドを追加
  def set_care_record
    @care_record = CareRecord.find(params[:id])
  end
end
