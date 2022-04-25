require './lib/caesar_cipher.rb'
describe "caesar cipher to only letters" do
    it "Only letter" do
        expect(caesar_cipher("What a string", 5)).to eql("Bmfy f xywnsl")
    end
    it "letter and nums" do
        expect(caesar_cipher("What 2 a string 3", 5)).to eql("Bmfy 2 f xywnsl 3")
    end
    it "letter, nums and symbols" do
        expect(caesar_cipher("What 2 a str?ng! 3", 5)).to eql("Bmfy 2 f xyw?sl! 3")
    end
end