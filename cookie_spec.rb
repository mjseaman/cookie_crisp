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
    subject{ cookie.type }
    # it "returns the type of the cookie" do
    it { should eq("peanut butter") }

  end

  describe "#bake!" do
    it "requires an integer time argument" do
      expect { cookie.bake! }.to raise_error(ArgumentError)
    end

    it "returns the cookie object" do
      expect { cookie.bake!(10).should be_a(Cookie) }
    end

    it "changes the status of the cookie when given enough time" do
      expect { cookie.bake!(10) }.to change(cookie, :status)
    end
  end

  describe "#status" do
    subject { cookie.status }

    it "returns the cookie's current status" do
      expect{ subject is_not nil }
    end

    context "when unbaked" do
      # p cookie
      # let(:cookie) { Cookie.new(type) }
      it {should eq :doughy}
    end

    context "when baked for less than 7 minutes" do
      before do
        cookie.bake!(6)
      end
      it {should eq :doughy}
    end  

    context "when baked for at least 7 but less than 10 minutes" do
      before do
        cookie.bake!(8)
      end
      it {should eq :almost_ready}
    end

    context "when baked for at least 10 but less than 12 minutes" do
      before do
        cookie.bake!(11)
      end
      it {should eq :ready}
    end

    context "when baked for at least 12 minutes" do
      before do
        cookie.bake!(13)
      end
      it {should eq :burned}
    end
  end
end
