require 'rails_helper'
include Devise::TestHelpers

RSpec.describe CoursesController, type: :controller do
  describe "GET #index" do
    fixtures :players

    it "returns http success for index" do
      sign_in(Player.find(1))
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    fixtures :players

    it "returns http success for show" do
      sign_in(Player.find(1))
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    fixtures :players

    it "returns http success for new" do
      sign_in(Player.find(1))
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    fixtures :players

    it "returns http success for edit" do
      sign_in(Player.find(1))
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    fixtures :players

    it "returns http success for create" do
      sign_in(Player.find(1))
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    fixtures :players

    it "returns http success for update" do
      sign_in(Player.find(1))
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    fixtures :players

    it "returns http success for destroy" do
      sign_in(Player.find(1))
      expect(response).to have_http_status(:success)
    end
  end

end
