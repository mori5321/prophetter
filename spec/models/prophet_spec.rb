require 'rails_helper'

RSpec.describe Prophet, type: :model do
  describe "#remaining_date" do
    let(:prophet) { FactoryBot.create(:prophet, published_at: published_at) }

    context "when published at is passed" do
      let(:published_at) { Time.zone.now - 1.day }

      it "returns 0" do
        expect(prophet.remaining_date).to eq 0
      end
    end

    context "when published at is after 1 day" do
      let(:now) { Time.zone.now }
      let(:published_at) { now + 1.day }

      it "returns 1" do
        expect(prophet.remaining_date).to eq 1
      end
    end

    context "when published at is after 3 days" do
      let(:now) { Time.zone.now }
      let(:published_at) { now + 3.day }

      it "returns 3" do
        expect(prophet.remaining_date).to eq 3
      end
    end

  end
end
