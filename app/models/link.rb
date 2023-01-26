class Link < ApplicationRecord
    validates_presence_of :lookup_code, :origial_url
    validates_uniqueness_of :lookup_code
    validates_uniqueness_of :short_url
    validate :origial_url_format
end

def origial_url_format
    uri = URI.parse(origial_url || '') # parse => #<URI::HTTP:0x202281be URL:http://www.ruby-lang.org/> 
    if uri.host.nil? #uri.host = "www.google.com"
        errors.add(:origial_url, "Invalid URL Format")
    end
end