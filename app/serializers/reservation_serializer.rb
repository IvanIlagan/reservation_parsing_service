class ReservationSerializer
  include JSONAPI::Serializer

  attributes :start_date,
             :end_date,
             :nights,
             :status,
             :number_of_adults,
             :number_of_children,
             :number_of_infants,
             :total_guests,
             :payment_currency

  attribute :payout_price do |model|
    model.payout_price&.to_fs(:rounded, precision: 2)
  end

  attribute :security_price do |model|
    model.security_price&.to_fs(:rounded, precision: 2)
  end

  attribute :total_price do |model|
    model.total_price&.to_fs(:rounded, precision: 2)
  end
end