module GuestParsers
  class BaseGuest
    def initialize(data)
      @data = data
    end

    def model
      Guest.new(
        id:,
        email:,
        first_name:,
        last_name:,
        phone_numbers:
      )
    end

    protected

    def id
      raise NotImplementedError
    end

    def email
      raise NotImplementedError
    end

    def first_name
      raise NotImplementedError
    end

    def last_name
      raise NotImplementedError
    end

    def phone_numbers
      raise NotImplementedError
    end
  end
end