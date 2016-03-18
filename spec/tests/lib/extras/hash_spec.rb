# Frozen-string-literal: true
# Copyright: 2015-2016 Jordon Bedwell - MIT License
# Encoding: utf-8

require "rspec/helper"
describe Hash do
  describe "#symbolize" do
    specify do
      expect({ "hello" => "world" }.symbolize).to eq({
        :hello => :world
      })
    end

    #

    context "allowed: [Class]" do
      it "should skip the values of that type" do
        expect({ "hello" => "world" }.symbolize(:allowed => [String])).to eq({
          "hello" => "world"
        })
      end
    end

    #

    context "allowed: nil" do
      it "should not throw and should continue" do
        expect({ "hello" => "world" }.symbolize(:allowed => nil)).to eq({
          :hello => :world
        })
      end
    end
  end

  #

  describe "#stringify" do
    specify do
      expect({ :hello => :world }.stringify).to eq({
        "hello" => "world"
      })
    end

    #

    context "allowed: [Class]" do
      it "should skip the values of that type" do
        expect({ :hello => :world }.stringify(:allowed => [Symbol])).to eq({
          :hello => :world
        })
      end
    end

    #

    context "allowed: nil" do
      it "should not throw and should continue" do
        expect({ 1 => 2 }.stringify(:allowed => nil)).to eq({
          "1" => "2"
        })
      end
    end
  end

  #

  describe "#stringify_keys" do
    it "should not stringify the values" do
      expect({ :a => :b }.stringify_keys).to eq({
        "a" => :b
      })
    end

    #

    context "allowed: [Class]" do
      it "should skip the values of that type" do
        expect({ :a => :b }.stringify_keys(:allowed => [Symbol])).to eq({
          :a => :b
        })
      end
    end

    #

    context "allowed: nil" do
      it "should not throw and should continue" do
        expect({ :a => :b }.stringify_keys(:allowed => nil)).to eq({
          "a" => :b
        })
      end
    end
  end

  #

  describe "#symbolize_keys" do
    it "should not symbolize the values" do
      expect({ "a" => "b" }.symbolize_keys).to eq({
        :a => "b"
      })
    end

    #

    context "allowed: [Class]" do
      it "should skip the values of that type" do
        expect({ :a => :b }.stringify_keys(:allowed => [Symbol])).to eq({
          :a => :b
        })
      end
    end

    #

    context "allowed: nil" do
      it "should not throw and should continue" do
        expect({ :a => :b }.stringify_keys(:allowed => nil)).to eq({
          "a" => :b
        })
      end
    end
  end

  #

  describe "#deep_merge" do
    it "should merge hashes into hashes" do
      expect({ 1 => 2, 3 => {}}.deep_merge({ 3 => { 4 => 5 }})).to eq({
        1 => 2, 3 => {
          4 => 5
        }
      })
    end

    #

    it "should merge normal values" do
      expect({ 1 => 2 }.deep_merge(1 => 3)).to eq({
        1 => 3
      })
    end
  end

  #

  describe "#any_key?" do
    context "when given any key that exists" do
      it "should return true" do
        expect({ :hello => :world }.any_key?(:world, :hello)).to eq(
          true
        )
      end
    end

    #

    context "when given all keys that don't exist" do
      it "should return false" do
        expect({ :hello => :world }.any_key?(:world)).to eq(
          false
        )
      end
    end
  end
 end
