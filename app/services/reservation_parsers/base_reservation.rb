module ReservationParsers
  class BaseReservation
    def initialize(data)
      @data = data || {}
    end

    def model
      Reservation.new(
        start_date:,
        end_date:,
        nights:,
        status:,
        number_of_adults:,
        number_of_children:,
        number_of_infants:,
        total_guests:,
        payment_currency:,
        payout_price:,
        security_price:,
        total_price:
      )
    end

    protected

    def start_date
      raise NotImplementedError
    end

    def end_date
      raise NotImplementedError
    end

    def nights
      raise NotImplementedError
    end

    def status
      raise NotImplementedError
    end

    def number_of_adults
      raise NotImplementedError
    end

    def number_of_children
      raise NotImplementedError
    end

    def number_of_infants
      raise NotImplementedError
    end

    def total_guests
      raise NotImplementedError
    end

    def payment_currency
      raise NotImplementedError
    end

    def payout_price
      raise NotImplementedError
    end

    def security_price
      raise NotImplementedError
    end

    def total_price
      raise NotImplementedError
    end

    def guest_id
      raise NotImplementedError
    end
  end
end