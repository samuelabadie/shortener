require 'rails_helper'

RSpec.describe Link, type: :model do
    it "valide si il à un URL d'origini et un look up code" do
        link = Link.new(
            original_url: "https://lesite/blog/articles/brancher-un-aspi",
            lookup_code: "1234567"
        )
        expect(link.valid?).to be(true)
    end

    it "n'est pas valide si il n'a pas de look up code" do
        link = Link.new(
            original_url: "https://lesite/blog/articles/brancher-un-aspi"
        )
        expect(link.valid?).to be(false)
    end


    it "n'est pas valide si il n'a pas d'URLd'origine'" do
        link = Link.new(
            lookup_code: "1234567"
        )
        expect(link.valid?).to be(false)
    end

    it "Voir si un look_up code est dupliqué" do
        link = Link.new(
            original_url: "https://lesite/blog/articles/brancher-un-aspi",
            lookup_code: "1234567"
        )   
        link.save

        link_2 = Link.new(
            original_url: "https://lesite/blog/articles/brancher-un-arbre",
            lookup_code: "1234567"
        )
        expect(link_2.valid?).to be(false)
    end
end
