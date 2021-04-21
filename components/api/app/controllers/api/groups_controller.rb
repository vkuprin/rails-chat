# frozen_string_literal: true

module Api
  class GroupsController < BaseController
    def create
      group = group_create_service.call(group_params)
      render json: Api::Serializers.group(group), status: :created
    rescue StandardError => exception
      respond(42_201, exception.message, 422)
    end

    def index
      groups = group_list_service.call
      render json: Api::Serializers.groups(groups), status: :ok
    rescue StandardError => exception
      respond(42_201, exception.message, 422)
    end

    def show
      group = group_show_service.call(params[:id])
      render json: Api::Serializers.group(group), status: :ok
    rescue GroupNotFound
      respond(40_401, exception.message, 404)
    rescue StandardError => exception
      respond(42_201, exception.message, 422)
    end

    protected

    def group_create_service
      Groups::CreateService.new
    end

    def group_list_service
      Groups::ListService.new
    end

    def group_show_service
      Groups::ShowService.new
    end

    def group_params
      params.require(:group).permit(:name)
    end
  end
end
