class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)   # 現在ログインしているユーザーが特定の本に「いいね」するための行為を「favorite」という変数に定義
                                                              # book = Book.find(params[:book_id])ここで見つけてきた特定の本のレコード、book_idをbook.idに代入している
    favorite.save
    redirect_to request.referer
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_to request.referer
  end
end
