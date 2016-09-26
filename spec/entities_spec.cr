require "./spec_helper"

describe Entities do
  it "decode named" do
    Entities.new("Christoph G&auml;rtner").decode.should eq "Christoph Gärtner"
  end

  it "decode num" do
    Entities.new("test&#x40;example.org").decode.should eq "test@example.org"
  end
end
