class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  validates :user_id, uniqueness: {scope: :book_id}    # いいねしたユーザーが、重複していいねできないようにしている。scope以降　user_idとbook_id（いいねしたユーザーとその本）のペアがすでにテーブルにないか見てくれている。
end
