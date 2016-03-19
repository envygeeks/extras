# ----------------------------------------------------------------------------
# Frozen-string-literal: true
# Copyright: 2015-2016 Jordon Bedwell - MIT License
# Encoding: utf-8
# ----------------------------------------------------------------------------

require "rspec/helper"
describe Array do
  describe "#stringify" do
    specify do
      expect([:a].stringify).to eq [
        "a"
      ]
    end

    #

    context "allowed_keys: [Class]" do
      it "should allow matching classes to pass" do
        expect([:a].stringify(:allowed_keys => [Symbol])).to eq [
          :a
        ]
      end
    end

    #

    context "allowed_keys: nil" do
      it "should not throw and should continue" do
        expect([1].stringify(:allowed_keys => nil)).to eq [
          1
        ]
      end
    end
  end

  #

  describe "#symbolize" do
    specify do
      expect(["a"].symbolize).to eq [
        :a
      ]
    end

    #

    context "allowed_keys: [Class]" do
      it "should skip values that are that type" do
        expect(["a"].symbolize(:allowed_keys => [String])).to eq [
          "a"
        ]
      end
    end

    #

    context "allowed: nil" do
      it "should not throw and should continue" do
        expect(["a"].symbolize(:allowed_keys => nil)).to eq [
          :a
        ]
      end
    end
  end
end
