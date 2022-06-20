VOWELS = %w[a e o u i]
CONSONANTS = %w[b c d f g h j k l m n p q r s t v w x y z]

class PigLatinizer
    def piglatinize(txt)
        words = txt.split(" ")
        words.map {|word| piglatin(word)}.join(" ")
    end

    def piglatin(word)
        if VOWELS.include?(word[0].downcase)
            word + "way"
        else
            chars = word.chars
            loop do
                c = chars.shift
                if VOWELS.include? c.downcase
                    chars.unshift c
                    break
                else
                    chars << c
                end
            end
            chars.join + "ay"
        end
    end
end