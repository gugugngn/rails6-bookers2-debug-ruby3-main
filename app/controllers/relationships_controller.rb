class RelationshipsController < ApplicationController
  def create   # ユーザーをフォローするためのアクション
    user = User.find(params[:user_id]) # 現在のログインユーザー）が特定のユーザーをフォロー
    current_user.follow(user)
    redirect_to request.referer
  end

  def destroy    # ユーザーのフォローを解除するためのアクション
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to request.referer
  end

  def followings     # 特定のユーザーがフォローしているユーザーの一覧を表示するためのアクション　誰をフォローしているか
    user = User.find(params[:user_id])   # params[:user_id]によりURLから？対象のユーザーを特定し
    @users = user.followings     # そのユーザーがフォローしているユーザー（user.followings）を@usersに代入
  end

  def followers   # 特定のユーザーをフォローしているユーザーの一覧を表示するためのアクション　誰がフォローしているか
    user = User.find(params[:user_id])
    @users = user.followers
  end

end
