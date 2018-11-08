# == Schema Information
#
# Table name: visits
#
#  id            :bigint(8)        not null, primary key
#  user_id       :integer          not null
#  shortened_url :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Visit < ApplicationRecord
  validates :user_id, :url_id, presence: true 
  
  def self.record_visit!(user, shortened_url)
    url_visit = Visit.new(:user_id => user.id, :url_id => shortened_url.id)
  end 
end
