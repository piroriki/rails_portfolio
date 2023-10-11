class RelationshipsController < ApplicationController
    def create
        @other_user = User.find(params[:follower])
        current_user.follow(@other_user)
        #follow = current_user.active_relationships.build(follower_id: params[:user_id])
        #follow.save
        #redirect_to users_path, notice: 'フォローしました'
    end

    def destroy
        @user = current_user.Relationships.find(params[:id]).follower
        current_user.unfollow(params[:id])
        #follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
        #follow.destroy
        #redirect_to root_path, notice: 'フォロー解除しました'
    end
end
