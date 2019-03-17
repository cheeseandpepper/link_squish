require 'rails_helper'

describe Link, type: :model do
  let(:link) { build(:link) }
  
  describe 'validations' do
    let(:valid_urls) {
      [
        'http://google.com',
        'https://google.com',
        'https://www.school.edu',
        'https://something.cool.idk.io/path/to/something?params=anything&foo=bar'
      ]
    }

    let(:invalid_urls) {
      [
        'httttp://google.com',
        'http:google',
        'http//idk'
      ]
    }
    
    it 'will validate good source_urls' do
      valid_urls.each do |url|
        link.source_url = url
        expect(link).to be_valid
      end  
    end

    it 'will not validate bad source_urls' do
      invalid_urls.each do |invalid_url|
        link.source_url = invalid_url
        expect(link).to_not be_valid
      end
    end
  end

  describe '#generate_short_url' do
    context 'when short code present' do
      before do
        link.short_code = '123abc'
        link.short_url  = 'example.com/s/123abc'
      end
      
      it 'does not generate a new one' do
        expect(link).to_not receive(:squish_url)
        link.generate_short_url
      end
    end

    context 'when short code not present' do
      it 'generates a new short code' do
        expect(link).to receive(:squish_url)
        link.generate_short_url
      end

      it 'saves the short_code and short_url' do
        expect { link.generate_short_url }
          .to change { link.short_code }.from(nil).to(String)
          .and change { link.short_url }.from(nil).to(String)
      end
    end
  end
end
