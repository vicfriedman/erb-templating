require 'spec_helper'

describe 'SiteGenerator' do
  let(:site_generator) { SiteGenerator.new }

  describe '#make_index!' do
    before do
      Movie.reset_movies!
      Movie.make_movies!
    end

    it 'creates index.html in the _site directory' do
      site_generator.make_index!
      comparison = File.read('spec/fixtures/index.html')
      index = File.read('_site/index.html')
      expect(index).to eq(comparison)
    end

    it 'does NOT use erb' do
      expect(ERB).to_not receive(:new)
      site_generator.make_index!
    end
  end

  describe '#generate_pages!' do
  end
end