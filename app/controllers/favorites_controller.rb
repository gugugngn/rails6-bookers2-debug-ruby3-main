class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)   # 現在ログインしているユーザーが特定の本に「いいね」するための行為を「favorite」という変数に定義
    favorite.save
    redirect_to books_path
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_to books_path
  end
end
