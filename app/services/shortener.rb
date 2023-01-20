require 'digest/sha2' #faire du hash

class Shortener
    attr_reader :url, :link_model

    def initialize(url, link_model = Link)
        @url = url
        @link_model = link_model
    end

    def generate_short_link
        Link.create(origial_url: url, lookup_code: lookup_code )
    end

    def lookup_code
        loop do 
            code = get_fresh_code
            break code unless link_model.exists?(lookup_code: code)
        end
    end

    def get_fresh_code #cette ligne qui permet de générer un code unique 
        SecureRandom.uuid[0..6]
    end
end