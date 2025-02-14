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
class Reservation < ApplicationRecord
  belongs_to :guest

  validates_presence_of :start_date,
                        :end_date,
                        :nights,
                        :status,
                        :number_of_adults,
                        :number_of_children,
                        :number_of_infants,
                        :total_guests,
                        :payment_currency,
                        :payout_price,
                        :security_price,
                        :total_price,
                        :guest_id

  validates_numericality_of :nights,
                            :number_of_adults,
                            :number_of_children,
                            :number_of_infants,
                            :total_guests,
                            :payout_price,
                            :security_price,
                            :total_price

  validate :start_date_not_greater_than_end_date
  validate :end_date_not_less_than_start_date

  private

  def start_date_not_greater_than_end_date
    if (start_date.present? && end_date.present?) && start_date > end_date
      errors.add(:start_date, "must not be greater than end date")
    end
  end

  def end_date_not_less_than_start_date
    if (start_date.present? && end_date.present?) && end_date < start_date
      errors.add(:end_date, "must not be less than start date")
    end
  end
end
