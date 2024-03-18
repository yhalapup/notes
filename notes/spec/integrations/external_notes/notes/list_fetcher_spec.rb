require "rails_helper"

RSpec.describe ExternalNotes::Notes::ListFetcher do
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

    it "sends http request to externalnotes" do
      result
      expect(fetch_notes_request_stub).to have_been_requested.once
    end
  end
end
