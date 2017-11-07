module Response
    extend ActiveSupport::Concern
    def json_response(object, status = :ok)
        render json: object, status: status
    end

    def json_not_found()
        render json: { "message" => "Id o recurso no encontrado", "status" => 404}
    end
end