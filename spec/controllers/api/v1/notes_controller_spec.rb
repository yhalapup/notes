require "rails_helper"

RSpec.describe Api::V1::NotesController, type: :controller do
  describe "GET #show" do
    let(:result) { get :show, params: params }
    let(:params) { { id: 0 } }

    it "responds with proper status 200" do
      expect(result.status).to eq(200)
    end
  end

  describe "GET #index" do
    let(:result) { get :index, params: params }
    let(:params) { {} }

    it "responds with proper status 200" do
      expect(result.status).to eq(200)
    end
  end

  describe "POST #create" do
    let(:result) { post :create, params: params }
    let(:params) { {} }

    it "responds with proper status 201" do
      expect(result.status).to eq(201)
    end
  end

  describe "PATCH #update" do
    let(:result) { patch :update, params: params }
    let(:params) { { id: 0 } }

    it "responds with proper status 200" do
      expect(result.status).to eq(200)
    end
  end

  describe "DELETE #destroy" do
    let(:result) { delete :destroy, params: params }
    let(:params) { { id: 0 } }

    it "responds with proper status 204" do
      expect(result.status).to eq(204)
    end
  end
end
