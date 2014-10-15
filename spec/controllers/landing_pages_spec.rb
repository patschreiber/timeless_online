require "rails_helper"

RSpec.describe LandingPageController, :type => :controller do
  describe "GET #index" do
    it "renders the :index view" do
      get :index
    end
  end
end
