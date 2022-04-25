def caesar_cipher(string,n)
    arrayString = string.split('')
    arrayNum=[]
    arrayString.each do |chart|
        if (chart.ord > 64 and chart.ord < 91)
            if chart.ord+5 > 90
                arrayNum.push(n-90+chart.ord+64)
            else
                arrayNum.push(chart.ord+n)
            end
        elsif (chart.ord > 96 and chart.ord < 123)
            if chart.ord+n > 122
                arrayNum.push(n-122+chart.ord+96)
            else
                arrayNum.push(chart.ord+n)
            end
        else
            arrayNum.push(chart.ord)
        end
    end
    return arrayNum.map{|code| code.chr}.join
end

print caesar_cipher("What a string!", 5)
