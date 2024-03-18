require "rails_helper"

RSpec.describe Cron::ExternalNotes::SynchronizerJob do
  describe "#perform" do
    let(:result) { described_class.perform_now }

    context "when externalnotes responses with valid data" do
      let(:notes_url) { "#{ExternalNotes::Api::Client::BASE_URL}/notes" }
      let(:fetch_notes_payload) { File.read("spec/data/externalnotes/response/notes/list.json") }
      let(:fetch_notes_request_stub) do
        stub_request(:get, notes_url)
          .to_return(status: 200, body: fetch_notes_payload)
      end

      before do
        fetch_notes_request_stub
      end

      it "works without raising errors" do
        expect { result }.not_to raise_error
      end
    end
  end
end
