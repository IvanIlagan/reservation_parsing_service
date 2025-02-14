# == Schema Information
#
# Table name: reservations
#
#  id                 :bigint           not null, primary key
#  end_date           :date             not null
#  nights             :integer          not null
#  number_of_adults   :integer          not null
#  number_of_children :integer          not null
#  number_of_infants  :integer          not null
#  payment_currency   :string           not null
#  payout_price       :decimal(12, 2)   not null
#  security_price     :decimal(12, 2)   not null
#  start_date         :date             not null
#  status             :string           not null
#  total_guests       :integer          not null
#  total_price        :decimal(12, 2)   not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  guest_id           :bigint
#
# Indexes
#
#  index_reservations_on_guest_id  (guest_id)
#
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

  attribute :guest_email do |model|
    model.guest.email
  end
end
