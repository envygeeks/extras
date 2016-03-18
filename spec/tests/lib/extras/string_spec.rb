# Frozen-string-literal: true
# Copyright: 2015-2016 Jordon Bedwell - MIT License
# Encoding: utf-8

require "rspec/helper"
describe String do
  it do
    is_expected.to respond_to(
      :regexp_escape
    )
  end

  #

  describe "#to_a" do
    it "should accept the standard escape char" do
      expect("hello\\ world hi!".to_a).to eq [
        "hello world", "hi!"
      ]
    end

    #

    it "should split the string" do
      expect("hello world".split).to eq [
        "hello", "world"
      ]
    end

    #

    context "char: val" do
      it "should split by that char" do
        expect("hello:world".to_a(char: ":")).to eq [
          "hello", "world"
        ]
      end
    end
  end
end
