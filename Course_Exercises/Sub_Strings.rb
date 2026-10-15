

def substrings(text, dictionary)
    downcased = text.downcase

    dictionary.each_with_object(Hash.new(0)) do |word, result|
        count = downcased.scan(word.downcase).length
        result[word] += count if count > 0
    end
end




dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts "\nTEST 1. 'below'"
p substrings("below", dictionary)

puts "\nTEST 2. 'Howdy partner, sit down! How's it going?'"
p substrings("Howdy partner, sit down! How's it going?", dictionary)





