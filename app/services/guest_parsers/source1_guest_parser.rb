module GuestParsers
  class Source1GuestParser < BaseGuest

    def initialize(data)
      @data = data["reservation"] || {}
    end

    protected

    def id
      @data["guest_id"]
    end

    def email
      @data["guest_email"]
    end

    def first_name
      @data["guest_first_name"]
    end

    def last_name
      @data["guest_last_name"]
    end

    def phone_numbers
      @data["guest_phone_numbers"]
    end
  end
end