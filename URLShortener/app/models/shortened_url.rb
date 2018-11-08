# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint(8)        not null, primary key
#  short_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  long_url   :string           not null
#  user_id    :integer          not null
#

class ShortenedUrl < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true
  
  def self.random_code
    code = SecureRandom.urlsafe_base64(16)
    ShortenedUrl.exists?(short_url: code) ? ShortenedUrl.random_code : code
  end
  
  def self.create!(user, long_url)
    short_url = ShortenedUrl.random_code
    create_url = ShortenedUrl.new(:long_url => long_url, :short_url => short_url, :user_id => user.id)
    create_url.save
  end
end

