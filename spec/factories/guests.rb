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
FactoryBot.define do
  factory :guest do
    email { "test@test.com" }
    first_name { "Test" }
    last_name { "Guest" }
    phone_numbers { ["123"] }
  end
end
