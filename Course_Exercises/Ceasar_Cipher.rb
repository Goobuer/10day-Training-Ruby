class CeasarCipher
    attr_reader :shift

    def initialize(shift)
        @shift = shift % 26
    end

    def encrypt(text)
        lowercase = ("a".."z").to_a
        uppercase = ("A".."Z").to_a
        source = (lowercase + uppercase).join
        shifted = (lowercase.rotate(@shift) + uppercase.rotate(@shift)).join

        text.tr(source, shifted)
    end

    def decrypt(text)
        inverse = CeasarCipher.new(-@shift)
        inverse.encrypt(text)
    end
end

