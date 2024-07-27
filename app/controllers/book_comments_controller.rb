class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)  # 現在ログインしているユーザの新規コメントを”comment"とする
    comment.book_id = book.id  # コメントが投稿された特定の本に"comment.book_id"と名前つけ
    comment.save  # ようやく保存
    redirect_to request.referer
  end
  
  def destroy 
    BookComment.find(params[:id]).destroy
    redirect_to request.referer
  end
  
  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

  
end
