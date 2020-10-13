class CommentsController < ApplicationController
  # コメントを保存、投稿するためのアクションです。
  def create
    # CareRecordをパラメータの値から探し出し,CareRecordに紐づくcommentsとしてbuildします。
    @care_record = CareRecord.find(params[:care_record_id])
    @comment = @care_record.comments.build(comment_params)
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to care_record_path(@care_record) }
      else
        format.html { redirect_to care_record_path(@care_record), notice: '投稿できませんでした...' }
      end
    end
  end
  private
  # ストロングパラメーター
  def comment_params
    params.require(:comment).permit(:care_record_id, :addcontent)
  end
end