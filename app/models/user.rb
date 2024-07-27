class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_one_attached :profile_image
  
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy  # `follower`という名前の関連を定義、中間テーブルの外部キーとして「follower_id」を使用
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy  # `followed`という名前の関連を定義
  has_many :followings, through: :active_relationships,source: :followed  # `following_user`という名前の関連を定義、中間テーブルとして「follower」を使用することを指定、中間テーブルの関連先を「followed」
  has_many :followers, through: :passive_relationships,source: :follower   # `follower_user`という名前の関連を定義、中間テーブルとして「followed」を使用、中間テーブルの関連先を「follower」として指定

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
  
  def follow(user)   # 指定したユーザーをフォローする行為を定義、モデルかコントローラで使えるよ
    active_relationships.create(followed_id: user.id)  # create()の部分で、followed_idというカラムに、指定したuser_idの値が新しいレコードとして保存される
  end
  
  def unfollow(user)   # 指定したユーザーのフォローを解除する
    active_relationships.find_by(followed_id: user.id).destroy     # `followed_id`カラムが`user_id`と一致するレコードを検索
  end
  
  def following?(user)   # 指定したユーザーをフォローしているかどうかを判定
    followings.include?(user)
  end
end
