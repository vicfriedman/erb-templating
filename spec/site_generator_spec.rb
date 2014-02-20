require 'spec_helper'

describe 'SiteGenerator' do
  let(:site_generator) { SiteGenerator.new }

  describe '#make_index!' do
    it 'creates index.html in the _site directory' do
      Movie.reset_movies!
      Movie.make_movies!
      site_generator.make_index!
      comparison = File.read('spec/fixtures/index.html')
      index = File.read('_site/index.html')
      expect(index).to eq(comparison)
    end
  end

  describe '#generate_pages!' do
  end
end