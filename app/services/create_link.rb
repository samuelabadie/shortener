require 'digest/sha2' #faire du hash

class CreateLink
  attr_reader :url # "http://www.google.com"

  def initialize(url)
    @url = url
  end 

  def run
    Link.create(original_url: url, lookup_code: lookup_code)
  end

  private

  def get_fresh_code #cette ligne qui permet de générer un code unique 
    SecureRandom.uuid[0..6] # "7yhgy76"
  end

  def lookup_code
    loop do 
      code = get_fresh_code
      break code unless Link.exists?(lookup_code: code)
    end
  end

end