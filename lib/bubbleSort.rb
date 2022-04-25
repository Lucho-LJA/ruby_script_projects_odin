def bubble_sort(array)
    length_loop=array.length
    auxNumber=0
    n=0;
    while length_loop >1 do
        for i in 0...length_loop-1 do
            if array[i] > array[i+1]
                auxNumber=array[i]
                array[i]=array[i+1]
                array[i+1]=auxNumber
            end
            n=i
        end
        length_loop = n+1
    end
    array
end

print bubble_sort([4,3,78,2,0,2])