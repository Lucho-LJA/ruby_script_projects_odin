def substrings(str,dic)
    arrayStr = str.split(' ')
    hashResult = Hash.new(0)
    dic.each do |key|
        arrayStr.each do |word|
            if word.upcase.include?(key.upcase) then hashResult[key]+=1 end
        end
    end
    hashResult
    
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
print substrings("below", dictionary), "\n"
print substrings("Howdy partner, sit down! How's it going?", dictionary)