require "rails_helper"

RSpec.describe Api::V1::NotesController, type: :controller do
  let(:first_note) { create(:note, title: "First note", content: "text") }
  let(:second_note) { create(:note, title: "Second note", content: "other text") }
  let(:third_note) { create(:note, title: "Third note", content: "other text") }

  let(:response_body) { result.body }
  let(:json) { JSON.parse(response_body) }
  let(:json_data) { json["data"].deep_symbolize_keys }

  describe "GET #index" do
    let(:result) { get :index, params: params }
    let(:params) { {} }

    before do
      first_note
      second_note
      third_note
    end

    it "responds with proper status 200" do
      expect(result.status).to eq(200)
    end

    it "provides JSON data" do
      expect(json["links"]).to eql(
        {
          "first" => "/api/v1/notes?page=1", "last" => "/api/v1/notes?page=2",
          "next" => "/api/v1/notes?page=2", "prev" => "/api/v1/notes", "self" => "/api/v1/notes?page=1"
        }
      )
      expect(json["meta"]).to eql("totalPages" => 2)
    end
  end

  describe "GET #show" do
    let(:result) { get :show, params: params }
    let(:params) { { id: 0 } }

    context "when record exists in DB" do
      let!(:record) { first_note }
      let(:params) { { id: record.id } }

      it "responds with status 200" do
        expect(result.status).to eq(200)
      end

      it "provides JSON data" do
        expect(json_data[:attributes]).to include(title: "First note", content: "text")
        expect(json_data.keys.sort).to eq(%i[attributes id type])
        expect(json_data[:attributes].keys.sort).to eq(%i[content created-at title updated-at])
      end
    end

    context "when record does not exist in DB" do
      let(:params) { { id: 0 } }

      it "responds with status 404" do
        expect(result.status).to eq(404)
      end

      it "reports error" do
        expect(json).to eq({ "errors" => [{ "detail" => "Record not found" }], "status" => 404 })
      end
    end
  end

  describe "POST #create" do
    let(:result) { post :create, params: params }
    let(:params) { { note: { title: "new note", content: "content" } } }

    context "with valid params" do
      let(:params) { super() }

      it "responds with status 201" do
        expect(result.status).to eq(201)
      end

      it "creates record in db" do
        expect { result }.to change(Note, :count).by(1)
      end
    end

    context "with invalid params" do
      let(:params) { super().merge!(note: { title: "a" * 51 }) }

      it "responds with status 400" do
        expect(result.status).to eq(400)
      end

      it "does not create record in db" do
        expect { result }.not_to change(Note, :count)
      end

      it "reports error" do
        expect(json).to eq(
          {
            "errors" => [
              { "detail" => "Title is too long (maximum is 50 characters)" }, { "detail" => "Content can't be blank" },
              { "detail" => "Content is too short (minimum is 1 character)" }
            ],
            "status" => 400
          }
        )
      end
    end
  end

  describe "PATCH #update" do
    let(:result) { patch :update, params: params }
    let(:params) { { id: 0 } }

    context "when record exists in DB" do
      let!(:record) { first_note }
      let(:params) { { id: record.id } }

      context "with valid params" do
        let(:params) { super().merge!(note: { title: "updated title", content: "updated content" }) }

        it "responds with status 200" do
          expect(result.status).to eq(200)
        end

        it "updates note" do
          expect { result }
            .to change { record.reload.title }.to("updated title")
                                              .and change { record.reload.content }.to("updated content")
        end

        it "provides JSON data" do
          expect(json_data[:attributes]).to include(title: "updated title", content: "updated content")
          expect(json_data.keys.sort).to eq(%i[attributes id type])
          expect(json_data[:attributes].keys.sort).to eq(%i[content created-at title updated-at])
        end
      end

      context "with invalid params" do
        let(:params) { super().merge!(note: { title: "a" * 51 }) }

        it "responds with status 400" do
          expect(result.status).to eq(400)
        end

        it "does not update note" do
          expect { result }
            .to not_change { record.reload.title }
            .and(not_change { record.reload.content })
        end

        it "reports error" do
          expect(json).to eq(
            {
              "errors" => [
                { "detail" => "Title is too long (maximum is 50 characters)" }
              ],
              "status" => 400
            }
          )
        end
      end
    end

    context "when record does not exist in DB" do
      let(:params) { { id: 0 } }

      it "responds with status 404" do
        expect(result.status).to eq(404)
      end

      it "reports error" do
        expect(json).to eq({ "errors" => [{ "detail" => "Record not found" }], "status" => 404 })
      end
    end
  end

  describe "DELETE #destroy" do
    let(:result) { delete :destroy, params: params }
    let(:params) { { id: 0 } }

    context "when record exists in DB" do
      let!(:record) { first_note }
      let(:params) { { id: record.id } }

      it "responds with status 204" do
        expect(result.status).to eq(204)
      end

      it "removes record in db" do
        expect { result }.to change(Note, :count).by(-1)
      end
    end

    context "when record does not exist in DB" do
      let(:params) { { id: 0 } }

      it "responds with status 404" do
        expect(result.status).to eq(404)
      end

      it "does not remove record in db" do
        expect { result }.to change(Note, :count).by(0)
      end

      it "reports error" do
        expect(json).to eq({ "errors" => [{ "detail" => "Record not found" }], "status" => 404 })
      end
    end
  end
end
