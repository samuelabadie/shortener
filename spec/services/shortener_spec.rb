require "rails_helper"

RSpec.describe Shortener do

    it "enregistrer une url avec un lookup code unique" do #on vient vérifier si le short url ramène bien à l'url de départ
        url = 'htttp://gouvernement/cuisine/recettes/magret'
        shortener = Shortener.new(url)
        link = shortener.generate_short_link 
        expect(link.valid?).to be(true)

        link_2 = shortener.generate_short_link
        expect(link.valid?).to be(true)
    end


end