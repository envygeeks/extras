# ----------------------------------------------------------------------------
# Frozen-string-literal: true
# Copyright: 2015-2016 Jordon Bedwell - MIT License
# Encoding: utf-8
# ----------------------------------------------------------------------------

require "rspec/helper"
describe Shellwords do
  describe "#escape" do
    context "when given an array" do
      it "should escape the values without merging" do
        expect(described_class.escape(["&"])).to eq [
          described_class.escape("&")
        ]
      end
    end

    #

    context "when given a hash" do
      it "should escape only the values" do
        expect(described_class.escape("&" => "&")).to eq({
          "&" => described_class.escape("&")
        })
      end
    end

    #

    context "when given an empty string in an empty string" do
      it "returns an empty string" do
        expect(described_class.escape('""')).to eq(
          '""'
        )
      end
    end

    #

    it "should return an empty string if given an empty string" do
      expect(described_class.escape("")).to eq(
      '""'
      )
    end

    #

    it "should return an empty string if given nil" do
      expect(described_class.escape(nil)).to eq(
        '""'
      )
    end

    #

    it "should not re-escape strings" do
      expect(described_class.escape(described_class.escape("&"))).to eq(
        described_class.escape("&")
      )
    end
  end
end
