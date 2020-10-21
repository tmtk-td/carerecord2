class StaffInfosController < ApplicationController
  before_action :set_staff_info, only: [:edit, :update, :destroy]
  def index
    @staff_infos = StaffInfo.all.order(info_date: "desc")
  end
  def new
    @staff_info = StaffInfo.new
  end
  def create
    @staff_info = StaffInfo.new(staff_info_params)
    @staff_info.user_id = current_user.id
    # @staff_info.user_id = current_user.id
    if @staff_info.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to staff_infos_path, notice: "連絡事項を作成しました！"
    else
      # 入力フォームを再描画します。
      render :new
    end
  end
  def edit
    @staff_info = StaffInfo.find(params[:id])
  end
  def update
    @staff_info = StaffInfo.find(params[:id])
    if @staff_info.update(staff_info_params)
      redirect_to staff_infos_path, notice: "編集しました！"
    else
      render :edit
    end
  end
  def destroy
    @staff_info.destroy
    redirect_to staff_infos_path, notice:"削除しました！"
  end
  private
  def staff_info_params
    params.require(:staff_info).permit(:info, :info_date, :user_id)
  end
  def set_staff_info
    @staff_info = StaffInfo.find(params[:id])
  end
end