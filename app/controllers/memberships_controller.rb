class MembershipsController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response
    def create
        membership = Membership.create!(membership_params)

         render json: membership
    end

    def index
        render json: Membership.all
    end

    private

    def membership_params
        params.permit(:charge, :gym_id, :client_id)
    end

    def unprocessable_entity_response
        render json: {error: ["validation errors"]}, status: :unprocessable_entity
    end
end
