require "rails_helper"

RSpec.describe Note, type: :model do
  let(:instance) { described_class.new(**options) }
  let(:options) { {} }

  describe "#new" do
    let(:result) { instance }

    context "with valid params" do
      let(:options) { { title: "title", content: "content" } }

      it "has valid instance" do
        expect(result).to be_a(described_class)
      end
    end
  end
end
