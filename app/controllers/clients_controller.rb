class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response

    def index
        render json: Client.all
    end

    def show
        render json: Client.find(params[:id])
    end

    def destroy
        client = Client.find(params[:id])
        client.destroy
        head :no_content
    end

    def update
        client = Client.find(params[:id])
        client.update(client_params)
        render json: client, status: :created
    end

    private

    def client_params
        params.permit(:name, :age)
    end
     
    def unprocessable_entity_response
        render json: {error: "Client not found"}, status: :unprocessable_entity
    end
end