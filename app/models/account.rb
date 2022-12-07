# == Schema Information
#
# Table name: accounts
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Account < ApplicationRecord
  validates_presence_of :name

  has_many :jobs, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :applicants, through: :jobs, enable_updates: { on: :create }
end
