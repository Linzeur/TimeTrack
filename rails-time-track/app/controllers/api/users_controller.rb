module Api
  class Api::UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    def index
      render json: User.all
    end

    def create
      user = User.new(user_params)
      if user.save
        render json: user, status: :created
      else
        render json: { errors: user.errors}, status: :unprocessable_entity
      end
    end

    def show 
      render json: @user
    end

    def update
      if @user.update(user_params)
        render json: @user, status: :ok
      else
        render json: {errors: user.errors}
      end
    end
    
    def destroy
      @user.destroy
      render json: {}, status: :no_content
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { message: e.message }, status: :not_found
    end

    private 

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:name, :email, :password, :role, :rate)
    end

  end
end