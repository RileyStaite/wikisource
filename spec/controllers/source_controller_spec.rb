require 'rails_helper'

RSpec.describe SourceController, type: :controller do
render_views

############### Add new tests here ###############

  describe "GET #index" do
    describe "Given nothing" do
      it "It runs" do
        get :index
      end

      it "It renders index" do
        get :index
        expect(subject).to render_template("source/index")
      end
    end

    describe "Given an empty search" do
      params = {"search" => ""}

      it "It runs" do
        get :index
      end

      it "It renders index" do
        get :index
        expect(subject).to render_template("source/index")
      end
    end

    describe "Given the UCCS wiki search" do
      params = {"search" => "https://en.wikipedia.org/wiki/University_of_Colorado_Colorado_Springs"}
      it "It runs" do
        get :index
      end

      it "It renders index" do
        get :index
        expect(subject).to render_template("source/index")
      end
    end
  end

##################################################


end
