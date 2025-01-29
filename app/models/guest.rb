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
class Guest < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email

  has_many :reservations
end
