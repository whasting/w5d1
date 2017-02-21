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

require 'rails_helper'

RSpec.describe Goal, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:owner_id) }
    it { should validate_presence_of(:visibility) }
    it { should validate_presence_of(:status) }
  end

  describe 'associations' do
    it { should belong_to(:owner) }
  end
end
