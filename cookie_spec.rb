require 'rspec'

require_relative 'cookie'

describe Cookie do

  let(:type)   { "peanut butter" }
  let(:cookie) { Cookie.new(type) }

  describe "#initialize" do
    context "with valid input" do
      it "creates a new Cookie of the specified type" do
        cookie.type.should eq(type)
      end
    end

    context "with invalid input" do
      it "throws an argument error when not given a type argument" do
        expect { Cookie.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#type" do
    it "returns the type of the cookie"
  end

  describe "#bake!" do
    it "requires an integer time argument"

    it "returns the cookie object"

    it "changes the status of the cookie when given enough time" do
      expect { cookie.bake!(10) }.to change(cookie, :status)
    end
  end

  describe "#status" do
    it "returns the cookie's current status"

    context "when unbaked" do
      it "is `:doughy`" 
    end

    context "when baked for less than 7 minutes" do
      it "is `:doughy`"
    end  

    context "when baked for at least 7 but less than 10 minutes" do
      it "is `:almost_ready`"
    end

    context "when baked for at least 10 but less than 12 minutes" do
      it "is `:ready`"
    end

    context "when baked for at least 12 minutes" do
      it "is `:burned`"
    end
  end
end