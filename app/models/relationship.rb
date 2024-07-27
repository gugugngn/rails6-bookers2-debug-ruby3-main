class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  # 中間テーブルを介さずに多対多の関係を実現。followerとfollowedのモデルは存在していないため、関連先のモデルは「User」と指定してあげる必要あり。
end
