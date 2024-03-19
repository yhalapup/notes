require "rails_helper"

RSpec.describe ExternalNotes::Synchronizer do
  let(:instance) { described_class.new }
  let(:notes_url) { "#{ExternalNotes::Api::Client::BASE_URL}/notes" }
  let(:result) { method.call(**params) }
  let(:params) { {} }

  describe "#execute" do
    let(:method) { instance.method(:execute) }
    let(:fetch_notes_payload) { File.read("spec/data/externalnotes/response/notes/list.json") }
    let(:fetch_notes_request_stub) do
      stub_request(:get, notes_url)
        .to_return(status: 200, body: fetch_notes_payload)
    end

    before do
      fetch_notes_request_stub
    end

    it "saves external notes in database" do
      expect { result }.to change(Note, :count).by(5)
    end

    it "sets source=externalnotes" do
      result
      expect(Note.last.source).to eql("externalnotes")
    end
  end
end
