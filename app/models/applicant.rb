# == Schema Information
#
# Table name: applicants
#
#  id         :uuid             not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  phone      :string
#  stage      :string
#  status     :string
#  job_id     :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Applicant < ApplicationRecord
  belongs_to :job

  enum stage: {
    application: 'application',
    interview: 'interview',
    offer: 'offer',
    hired: 'hire'
  }

  enum status: {
    active: 'active',
    inactive: 'inactive'
  }

  validates_presence_of :first_name, :last_name, :email

  def name
    [first_name, last_name].join(' ')
  end

  has_one_attached :resume
end
