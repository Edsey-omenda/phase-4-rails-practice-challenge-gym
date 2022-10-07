class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Gym.all
    end

    def show
        render json: Gym.find(params[:id])
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        head :no_content
    end

    def update
        gym = Gym.find(params[:id])
        gym.update(gym_params)
        render json: gym, status: :created
    end


    private

    def gym_params
        params.permit(:name, :address)
    end

    def render_not_found_response
      render json: { error: "Gym not found" }, status: :not_found
    end
end