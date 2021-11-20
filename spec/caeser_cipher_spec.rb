require './lib/caeser_cipher'

describe "caeser_cipher" do
  it "replace each character in the given string with a character the given number of places down the alphabet" do
    expect(caeser_cipher("pie", 4)).to eql("tmi")
  end
  it "loops to the start of the alphabet" do
    expect(caeser_cipher("zoO", 2)).to eql("bqQ")
  end
  it "handles larger integers" do
    expect(caeser_cipher("Harambe", 10)).to eql("Rkbkwlo")
  end
  it "handles negative integers" do
    expect(caeser_cipher("stinKy", -1)).to eql("rshmJx")
  end
  it "loops all the way around the alphabet" do
    expect(caeser_cipher("pie", 26)).to eql("pie")
  end
  it "removes spaces" do
    expect(caeser_cipher("a p p l e", 4)).to eql("ettpi")
  end
end

