# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    subject { User.new(username: "test", password: "tested") }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:password_digest) }

    it { should validate_presence_of(:session_token) }
    it { should validate_uniqueness_of(:session_token) }

    it { should validate_length_of(:password).is_at_least(6) }

  end

  describe "associations" do
    it "should have many goals"
  end

  describe "::find_by_credentials" do
    let!(:test_user) { User.create!(username: "test", password: "tested") }

    it "should return a user with matching creds" do
      expect(User.find_by_credentials("test", "tested")).to eq(test_user)
    end

    it "should return nil if not found" do
      expect(User.find_by_credentials("test1", "tested")).not_to eq(test_user)
    end
  end
end
