require 'rails_helper'

RSpec.describe LinksController, type: :conntroller do

    include RSpec::Rails::ControllerExampleGroup
    it 'peut créer un lien venant d un utilisateur' do
        request.env['HTTP_ACCEPT'] = 'text/javascript'
        
        url = 'https://lesite/blog/articles/brancher-un-aspirateur'
        
        post :create, params: {link: {original_url: url}}
        link = assigns(:link)
        expect(link.original_url).to eq(url)
        expect(link.valid?).to be(true)
        expect(link.lookup_code.length).to eq(7)
        expect(link.persisted?).to be(true)
        expect(response).to render_template('create')
    end
end
