class CommentsController < ApplicationController
  before_action :set_care_record, only: [:create, :edit, :update]
  # コメントを保存、投稿するためのアクションです。
  def create
    # CareRecordをパラメータの値から探し出し,CareRecordに紐づくcommentsとしてbuildします。
    @care_record = CareRecord.find(params[:care_record_id])
    @comment = @care_record.comments.build(comment_params)
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.js { redirect_to care_record_path(@care_record), notice: '入力せずに記録はできません。' }
      end
    end
  end
  def edit
    @comment = @care_record.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = '記録の編集中'
      format.js { render :edit }
    end
  end
  def update
    @comment = @care_record.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = '編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = '編集に失敗しました'
          format.js { render :edit_error }
        end
      end
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end
  private
  # ストロングパラメーター
  def comment_params
    params.require(:comment).permit(:care_record_id, :addcontent)
  end
  def set_care_record
    @care_record = CareRecord.find(params[:care_record_id])
  end
end