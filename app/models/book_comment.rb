class BookComment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :comment, presence: true  # アプリケーションにおいて無効なデータ（`comment` 属性がからっぽのデータ）が保存されることを防ぐ
end
