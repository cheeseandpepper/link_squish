require 'rails_helper'

describe ShortUrlsController, type: :controller do
  
  let(:link) { create(:link) } 
  
  before do
    @request.host = 'example.com'
  end

  describe 'GET show' do
    context 'when link is found' do
      it 'it redirects to the source_url' do
        get :show, params: {id: link.short_code}
        expect(response.status).to redirect_to(link.source_url)
      end

      it 'increments the hit count' do
        expect {
          get :show, params: {id: link.short_code}
        }.to change { link.reload.hits }.by(1) 
      end

      it 'broadcasts the updated hit count' do
        expected_hit_count = link.hits + 1
        expect(ActionCable.server).to receive(:broadcast).with('links_channel', message: expected_hit_count)
        get :show, params: {id: link.short_code}
      end
    end

    context 'when link is not found' do
      context 'record exists, but not active' do
        before do
          link.update(active: false)
        end

        it 'redirects to not_found page' do
          get :show, params: {id: link.short_code}
          expect(response.status).to redirect_to(not_found_path)
        end
      end

      context 'record does not exist' do
        it 'redirects to not_found page' do
          get :show, params: {id: '123'}
          expect(response.status).to redirect_to(not_found_path)
        end
      end
    end
  end
end