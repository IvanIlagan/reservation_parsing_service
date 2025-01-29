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
require "rails_helper"

RSpec.describe Reservation, type: :model do
  let(:reservation) { build(:reservation) }

  it "has a valid Factory" do
    expect(reservation).to be_valid
  end

  subject { reservation }

  describe "Validations" do    
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:nights) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:number_of_adults) }
    it { should validate_presence_of(:number_of_children) }
    it { should validate_presence_of(:number_of_infants) }
    it { should validate_presence_of(:total_guests) }
    it { should validate_presence_of(:payment_currency) }
    it { should validate_presence_of(:payout_price) }
    it { should validate_presence_of(:security_price) }
    it { should validate_presence_of(:total_price) }
    it { should validate_presence_of(:guest_id) }

    it { should validate_numericality_of(:nights) }
    it { should validate_numericality_of(:number_of_adults) }
    it { should validate_numericality_of(:number_of_children) }
    it { should validate_numericality_of(:number_of_infants) }
    it { should validate_numericality_of(:total_guests) }
    it { should validate_numericality_of(:payout_price) }
    it { should validate_numericality_of(:security_price) }
    it { should validate_numericality_of(:total_price) }
  end

  describe "Associations" do
    it { should belong_to(:guest) }
  end
end
