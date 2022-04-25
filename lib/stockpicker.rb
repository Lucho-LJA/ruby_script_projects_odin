def stock_picker(prices)
    index_low = 0
    index_high = 0
    gain = 0
    prices.each_with_index do|price,index|
        prices[0..index].each_with_index do|price1,index1|
            if price-price1>gain
                index_high=index
                index_low=index1
                gain = price-price1
            end
        end
    end

    return [index_low,index_high]
end

print stock_picker([17,3,6,9,15,8,6,1,10])
