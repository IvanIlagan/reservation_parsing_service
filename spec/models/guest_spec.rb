# == Schema Information
#
# Table name: guests
#
#  id            :bigint           not null, primary key
#  email         :string           not null
#  first_name    :string           not null
#  last_name     :string           not null
#  phone_numbers :string           is an Array
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  unique_emails  (email) UNIQUE
#
require "rails_helper"

RSpec.describe Guest, type: :model do
  let(:guest) { build(:guest) }

  it "has a valid Factory" do
    expect(guest).to be_valid
  end

  subject { guest }

  describe "Validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone_numbers) }

    it { should validate_uniqueness_of(:email) }
  end

  describe "Associations" do
    it { should have_many(:reservations) }
  end
end 
