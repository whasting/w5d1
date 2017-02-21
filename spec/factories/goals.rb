# == Schema Information
#
# Table name: goals
#
#  id          :integer          not null, primary key
#  description :string           not null
#  owner_id    :integer          not null
#  visibility  :string           not null
#  status      :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :goal do
    description "MyString"
    owner_id 1
    visibility "MyString"
    status "MyString"
  end
end
