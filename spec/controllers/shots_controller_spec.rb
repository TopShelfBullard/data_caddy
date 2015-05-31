require 'rails_helper'
include Devise::TestHelpers

RSpec.describe ShotsController, type: :controller do
  describe "GET #show" do
    it "returns http success" do
      sign_in(Player.find(1) ? Player.find(1) : Player.create!(email: 'jeffery@obviouslynotagolfer.com', password: 'password'))
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      sign_in(Player.find(1) ? Player.find(1) : Player.create!(email: 'jeffery@obviouslynotagolfer.com', password: 'password'))
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      sign_in(Player.find(1) ? Player.find(1) : Player.create!(email: 'jeffery@obviouslynotagolfer.com', password: 'password'))
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      sign_in(Player.find(1) ? Player.find(1) : Player.create!(email: 'jeffery@obviouslynotagolfer.com', password: 'password'))
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      sign_in(Player.find(1) ? Player.find(1) : Player.create!(email: 'jeffery@obviouslynotagolfer.com', password: 'password'))
      expect(response).to have_http_status(:success)
    end
  end

end
