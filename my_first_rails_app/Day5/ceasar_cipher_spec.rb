
require_relative '../Course_Exercises/Ceasar_Cipher'

RSpec.describe CeasarCipher do
    let(:cipher) { CeasarCipher.new(3) }

    describe "#encrypt" do
        it "shifts lowercase letters correctly" do
            expect(cipher.encrypt("hello")).to eq("khoor")
        end

        it "preserves uppercase letters and punctuation" do
            expect(cipher.encrypt("Hello, World!")).to eq("Khoor, Zruog!")
        end

        it "wraps shifts past the end of the alphabet" do
            expect(CeasarCipher.new(26).encrypt("xyz")).to eq("xyz")
            expect(CeasarCipher.new(29).encrypt("xyz")).to eq("abc")
        end

        it "supports negative shifts" do
            expect(CeasarCipher.new(-3).encrypt("abc")).to eq("xyz")
        end
    end

    describe "#decrypt" do
        it "returns an encrypted message to its original text" do
            original = "Ruby is fun!"
            encrypted = cipher.encrypt(original)

            expect(cipher.decrypt(encrypted)).to eq(original)
        end
    end
end
