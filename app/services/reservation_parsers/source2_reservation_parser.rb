module ReservationParsers
  class Source2ReservationParser < BaseReservation
    protected

    def start_date
      @data["start_date"]
    end

    def end_date
      @data["end_date"]
    end

    def nights
      @data["nights"]
    end

    def status
      @data["status"]
    end

    def number_of_adults
      @data["adults"]
    end

    def number_of_children
      @data["children"]
    end

    def number_of_infants
      @data["infants"]
    end

    def total_guests
      @data["guests"]
    end

    def payment_currency
      @data["currency"]
    end

    def payout_price
      @data["payout_price"]
    end

    def security_price
      @data["security_price"]
    end

    def total_price
      @data["total_price"]
    end

    def guest_id
      @data["guest"].try(:[], "id")
    end
  end
end