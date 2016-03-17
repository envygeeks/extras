# Frozen-string-literal: true
# Copyright: 2015-2016 Jordon Bedwell - MIT License
# Encoding: utf-8

require "rspec/helper"
describe Array do
  describe "#stringify" do
    specify do
      expect([:a].stringify).to eq [
        "a"
      ]
    end

    #

    context "allowed: [Class]" do
      it "should allow matching classes to pass" do
        expect([:a].stringify(:allowed => [Symbol])).to eq [
          :a
        ]
      end
    end

    #

    context "allowed: nil" do
      it "should not throw and should continue" do
        expect([1].stringify(:allowed => nil)).to eq %w(
          1
        )
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

    context "allowed: [Class]" do
      it "should skip values that are that type" do
        expect(["a"].symbolize(:allowed => [String])).to eq [
          "a"
        ]
      end
    end

    #

    context "allowed: nil" do
      it "should not throw and should continue" do
        expect(["a"].symbolize(:allowed => nil)).to eq [
          :a
        ]
      end
    end
  end
end
