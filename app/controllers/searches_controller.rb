class SearchesController < ApplicationController
 before_action :authenticate_user!
 
 def seach
   @model = params[:model] 
   @content = params[:content]   # ユーザーが入力した検索キーワード
   @method = params[:method]
   
   
 end
end
