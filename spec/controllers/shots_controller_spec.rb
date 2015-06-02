require 'rails_helper'
include Devise::TestHelpers

RSpec.describe ShotsController, type: :controller do

  describe "GET #show" do
    fixtures :players

    it "returns http success" do
      sign_in(Player.find(1))
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    fixtures :players

    it "returns http success" do
      sign_in(Player.find(1))
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    fixtures :players

    it "returns http success" do
      sign_in(Player.find(1))
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    fixtures :players

    it "returns http success" do
      sign_in(Player.find(1))
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    fixtures :players

    it "returns http success" do
      sign_in(Player.find(1))
      expect(response).to have_http_status(:success)
    end
  end

end
