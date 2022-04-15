require 'rails_helper'

RSpec.describe Reference, type: :model do
    it "is not valid without a url" do
        expect{Reference.parse(nil)}.to raise_error
    end
  it "is valid with a url" do
    link = "https://en.wikipedia.org/wiki/University_of_Colorado_Colorado_Springs"
    sources = Reference.parse(link)
    expect(sources).to be_truthy
  end
  it "should return a hash if valid" do
    link = "https://en.wikipedia.org/wiki/University_of_Colorado_Colorado_Springs"
    sources = Reference.parse(link)
    expect(sources).to be_a(Hash)
  end

end
