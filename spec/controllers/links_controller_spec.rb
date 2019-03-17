require 'rails_helper'

describe LinksController, type: :controller do
  describe 'GET index' do
    it 'renders a 200' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'POST create' do
    let(:params) {
      { 
        link: {
          source_url: 'https://google.com',
          active:     true
        }
      }
    }
    it 'creates a link record' do
      expect {post :create, params: params}.to change{Link.count}.by(1)
    end

    it 'redirects to the edit page' do
    end
  end

  describe 'GET edit' do
    it 'renders a 200' do
      expect(response.status).to eq(200)
    end
  end

  describe 'PATCH update' do
    let(:link) { create(:link, source_url: 'http://google.com', active: true) }
    let(:params) {
      { 
        link: {
          source_url: 'https://google.com',
          active:     false
        },
        id: link.id
      }
    }
    it 'updates the link' do
      expect {post :update, params: params}.to change{ link.reload.active }.from(true).to(false)
    end
  end
end