# == Schema Information
#
# Table name: notifications
#
#  id         :uuid             not null, primary key
#  user_id    :uuid             not null
#  read_at    :datetime
#  params     :jsonb
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Notification < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user

  scope :unread, -> { where(read_at: nil) }

  serialize :params

  def to_partial_path
  'notifications/notification'
  end
end
