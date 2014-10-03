require "rails_helper"

RSpec.describe LandingPageController, :type => :controller do
  describe "Homepage" do

    it "should exist" do
      get :index
      expect(response).to be_success
      expect(response.status).to be(200)
    end

    it "renders the template" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
