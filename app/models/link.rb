# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  long_url   :string(255)      not null
#  short_url  :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Link < ActiveRecord::Base
  validates :long_url, :short_url, presence: true

  def self.find_or_create!(options)
    link = Link.find_by_long_url(options[:long_url])

    unless link
      link = Link.create(long_url: options[:long_url], short_url: Link.generate_short_url)
    end

    link
  end

  def self.generate_short_url
    begin
      url = SecureRandom.hex(3)
    end while Link.find_by_short_url(url)

    url
  end
end
