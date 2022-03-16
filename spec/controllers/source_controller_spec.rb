require 'rails_helper'

RSpec.describe SourceController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "Expect #get_url" do
    it "return a string" do
      url = controller.get_url
      expect(url).to be_a_kind_of String
    end
  end

  describe "Expect #get_sources" do
    it "returns an array of strings" do
      expect(controller.get_sources).to be_an_instance_of(Array)
    end
  end


end
