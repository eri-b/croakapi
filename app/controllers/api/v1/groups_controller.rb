class Api::V1::GroupsController < ApplicationController
  before_action :set_group, only: [:show, :update, :destroy]
  include GroupHelper

  # GET /api/v1/groups
  def index
    @groups = Group.all

    render json: @groups
  end

  # GET /api/v1/groups/1
  def show
    render json: @group
  end

  # POST /api/v1/groups
  def create
    @group = Group.new(group_params)
    
    # prevent duplicate dms
    if params[:group][:dm]
      u1 = params[:group][:creator] #id of the creator
      u2 = params[:other] # id of the other user
      
      # option 1 no table
      groups_with_creator = GroupMember.where(user_id: u1).pluck(:group_id)
      users_in_these_groups = GroupMember.where(group_id: groups_with_creator).pluck(:user_id)
      return if users_in_these_groups.includes? u2

      # option 2 need table or row
      return if Group.dm_exists?(u1, u2)

      @group.update(dm_look_up: dm_look_up(u1, u2))
    end

    if @group.save
      render json: @group, status: :created, location: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/groups/1
  def update
    if @group.update(group_params)
      render json: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/groups/1
  def destroy
    @group.destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def group_params
      params.require(:group).permit(:name, :creator, :dm)
    end
end
