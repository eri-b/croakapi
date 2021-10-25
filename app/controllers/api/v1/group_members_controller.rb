class Api::V1::GroupMembersController < ApplicationController
  before_action :set_group_member, only: [:show, :update, :destroy]

  # GET /group_members
  def index
    @group_members = GroupMember.all

    render json: @group_members
  end

  # GET /group_members/1
  def show
    render json: @group_member
  end

  # POST /group_members
  def create
    @group_member = GroupMember.new(group_member_params)

    if @group_member.save
      render json: @group_member, status: :created, location: @group_member
    else
      render json: @group_member.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /group_members/1
  def update
    if @group_member.update(group_member_params)
      render json: @group_member
    else
      render json: @group_member.errors, status: :unprocessable_entity
    end
  end

  # DELETE /group_members/1
  def destroy
    @group_member.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_member
      @group_member = GroupMember.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def group_member_params
      params.fetch(:group_member, {})
    end
end
