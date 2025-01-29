class ReservationsService
  def save_reservation_from_different_sources(payload)
    if payload.key?("reservation")
      guest = GuestParsers::Source1GuestParser.new(payload).model
      reservation = ReservationParsers::Source1ReservationParser.new(payload).model
    else
      guest = GuestParsers::Source2GuestParser.new(payload).model
      reservation = ReservationParsers::Source2ReservationParser.new(payload).model
    end

    if Guest.find_by(email: guest.email).present? || guest.save
      reservation.guest_id = guest.id

      if reservation.save
        create_return_data(result: reservation)
      else
        create_return_data(
          result: nil,
          successful: false,
          error: { error: "Failed saving reservation" }
        )
      end
    else
      create_return_data(
          result: nil,
          successful: false,
          error: { error: "Failed saving reservation" }
        )
    end
  end

  private

  def create_return_data(result:, successful: true, error: nil, error_http_status: nil)
    OpenStruct.new(
      result:,
      success?: successful,
      error:,
      error_http_status:
    )
  end
end