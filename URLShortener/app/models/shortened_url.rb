# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint(8)        not null, primary key
#  short_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true
  
  def self.random_code
    code = SecureRandom.urlsafe_base64(16)
    ShortenedUrl.exists?(short_url: code) ? ShortenedUrl.random_code : code
  end
end

