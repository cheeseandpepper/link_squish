require 'rails_helper'

describe Link, type: :model do
  let(:link) { Link.new() }
  
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
end
