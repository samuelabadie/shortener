class Link < ApplicationRecord
  
  validates_presence_of :lookup_code, :original_url
  validates_uniqueness_of :lookup_code
  validate :original_url_format
  
  def short_url
    "http://#{ENV.fetch('HOST')}/#{lookup_code}"
  end
  
  private
  
  def original_url_format
    uri = URI.parse(original_url || '') # parse => #<URI::HTTP:0x202281be URL:http://www.ruby-lang.org/> 
    if uri.host.nil? #uri.host = "www.google.com"
      errors.add(:original_url, "Invalid URL Format")
    end
  end
  
end