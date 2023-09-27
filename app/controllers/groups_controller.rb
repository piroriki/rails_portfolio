class GroupsController < ApplicationController

    def new
        @group = Group.new(group_params)
    
    def create
        @user_id = current_user.id
        @family_id = Family.find(params[:family_id])
        @group = Group.new(user_id: @user_id, family_id: @family_id)
        if @group.save
            redirect_to root_path
        end
    end

    def destroy
    end

    private

    def group_params
        params.require(:group).permit(:user_id, :family_id)
    end
end
