require 'rails_helper'

RSpec.describe PostQuery do
  subject(:query){ described_class.new(relation) }
  let(:relation){ Post.unscoped }

  describe "#relation" do
    it "returns relation associated with query" do
      expect(query.narrow().relation).to eq(relation)
    end
  end

  describe "#narrow" do
    it "skips unrecognized filters" do
      expect(query.narrow(kind: "xxx").relation.to_sql).to eq(relation.to_sql)
    end

    context "for by custom lists filters" do
      let(:filters) do
        {
          custom_lists: ["Federal legislators"]
        }
      end

      it "applies conditions" do
        expected_rel = relation
          .joins(person: :custom_lists)
          .where("custom_lists.name IN (?)", ["Federal legislators"])
        
        expect(query.narrow(filters).relation.to_sql).to eq(expected_rel.to_sql)
      end
    end

    context "for by social accounts filters" do
      let(:filters) do
        {
          social_accounts: ["facebook", "twitter"]
        }
      end

      it "applies conditions" do
        expected_rel = relation
          .joins(:social_media_account)
          .where("social_media_accounts.kind IN (?)", ["facebook", "twitter"])
        
        expect(query.narrow(filters).relation.to_sql).to eq(expected_rel.to_sql)
      end
    end

    context "for by date filters" do
      let(:from){ 2.months.ago }
      let(:to){ 1.month.ago }
      let(:filters) do
        {
          from: from,
          to: to
        }
      end

      it "applies conditions" do
        expected_rel = relation
          .where('posts.posted_at BETWEEN ? AND ?', from, to)
        
        expect(query.narrow(filters).relation.to_sql).to eq(expected_rel.to_sql)
      end
    end
  end
end