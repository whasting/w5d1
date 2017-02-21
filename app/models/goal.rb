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

class Goal < ActiveRecord::Base
  belongs_to :owner,
             foreign_key: :owner_id,
             class_name: :User

  validates :description, :owner_id, :visibility, :status, presence: true
  
end
