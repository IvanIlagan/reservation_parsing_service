module ReservationParsers
  class Source1ReservationParser < BaseReservation

    def initialize(data)
      @data = data["reservation"] || {}
    end

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
      @data["status_type"]
    end

    def number_of_adults
      guest_details["number_of_adults"]
    end

    def number_of_children
      guest_details["number_of_children"]
    end

    def number_of_infants
      guest_details["number_of_infants"]
    end

    def total_guests
      @data["number_of_guests"]
    end

    def payment_currency
      @data["host_currency"]
    end

    def payout_price
      @data["expected_payout_amount"]
    end

    def security_price
      @data["listing_security_price_accurate"]
    end

    def total_price
      @data["total_paid_amount_accurate"]
    end

    private

    def guest_details
      @data["guest_details"] || {}
    end
  end
end