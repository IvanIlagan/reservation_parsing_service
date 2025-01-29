class ReservationsController < ApplicationController
  wrap_parameters false

  def create
    service_action = ::ReservationsService.new.save_reservation_from_different_sources(params)

    if service_action.success?
      render json: {
        data: ReservationSerializer.new(service_action.result)
                .serializable_hash[:data][:attributes]
      }
    else
      render json: service_action.error, status: :unprocessable_entity
    end
  end
end