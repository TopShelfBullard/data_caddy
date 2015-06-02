require 'rails_helper'

RSpec.describe ClubsController, type: :controller do
  include Devise::TestHelpers

  describe "GET #new" do
    it "returns http success" do
      sign_in(Player.create!(email: 'jeffery@obviouslynotagolfer.com', password: 'password'))
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      sign_in(Player.create!(email: 'jeffery@obviouslynotagolfer.com', password: 'password'))
      expect(response).to have_http_status(:success)
    end

  end

  describe "GET #show" do
    it "returns http success" do
      sign_in(Player.create!(email: 'jeffery@obviouslynotagolfer.com', password: 'password'))
      expect(response).to have_http_status(:success)
    end

  end
end

