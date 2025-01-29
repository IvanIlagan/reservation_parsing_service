module GuestParsers
  class Source2GuestParser < BaseGuest

    def initialize(data)
      @data = data["guest"] || {}
    end

    protected

    def id
      @data["id"]
    end

    def email
      @data["email"]
    end

    def first_name
      @data["first_name"]
    end

    def last_name
      @data["last_name"]
    end

    def phone_numbers
      [@data["phone"]].compact
    end
  end
end