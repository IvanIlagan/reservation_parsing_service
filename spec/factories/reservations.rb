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
FactoryBot.define do
  factory :reservation do
    start_date { Date.today }
    end_date { Date.today + 1.day }
    nights { 1 }
    status { "pending" }
    number_of_adults { 1 }
    number_of_children { 0 }
    number_of_infants { 0 }
    total_guests { 1 }
    payment_currency { "PHP" }
    payout_price { "5000.00" }
    security_price { "1000.00" }
    total_price { "6000.00" }
    guest_id { create(:guest).id }
  end
end
